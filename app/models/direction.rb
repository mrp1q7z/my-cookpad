class Direction < ActiveRecord::Base
  after_destroy :reorder_steps

  belongs_to :recipe

  has_attached_file :image, styles: { medium: "214x136>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def save_and_reorder
    Direction.where('step >= ?', self.step).update_all('step = step + 1')
    self.save
  end

  private

  def reorder_steps
    Direction.where('step > ?', self.step).update_all('step = step - 1')
  end
end
