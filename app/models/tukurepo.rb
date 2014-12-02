class Tukurepo < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  has_attached_file :image, styles: { medium: "120x120>" }
  validates_attachment :image, presence: true,
    content_type: { content_type: /\Aimage\/.*\Z/ }, less_than: 1.megabytes

  validates :message, presence: true
end
