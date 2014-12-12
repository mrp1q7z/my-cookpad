class Direction < ActiveRecord::Base
  after_destroy :reorder_steps

  belongs_to :recipe

  has_attached_file :image, styles: { medium: "136x214>" },
    storage: :s3,
    s3_permissions: :private,
    s3_credentials: "#{Rails.root}/config/s3.yml",
    path: ":class/:id/:style_:filename"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def save_and_reorder
    Direction.transaction do
      Direction.where('recipe_id = ? and step >= ?', self.recipe_id, self.step).
        update_all('step = step + 1')
      self.save
    end
  end

  def move(type)
    if type == :higher
      if self.step == 1
        errors.add(:step, "はすでに先頭です")
        return false;
      end
      val = -1
    else
      max_step = Direction.where("recipe_id = ?", self.recipe_id).maximum(:step)
      if max_step == self.step
        errors.add(:step, "はすでに最後です")
        return false;
      end
      val = 1
    end
    self.step += val
    direction = Direction.find_by(recipe_id: self.recipe_id, step: self.step)
    direction.step -= val

    Direction.transaction do
      self.save
      direction.save
    end
    return true
  end

  def authenticated_image_url(style)
    if image.present?
      image.s3_object(style).url_for(:read, secure: true)
    else
      image.url(style)
    end
  end

  private

  def reorder_steps
    Direction.where('recipe_id = ? and step > ?', self.recipe_id, self.step).update_all('step = step - 1')
  end
end
