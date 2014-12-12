class Tukurepo < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  has_attached_file :image, styles: { medium: "120x120>" },
    storage: :s3,
    s3_permissions: :private,
    s3_credentials: "#{Rails.root}/config/s3.yml",
    path: ":class/:id/:style_:filename"
  validates_attachment :image, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ }, less_than: 1.megabytes

  validates :message, presence: true

  def authenticated_image_url(style)
    if image.present?
      image.s3_object(style).url_for(:read, secure: true)
    else
      image.url(style)
    end
  end
end
