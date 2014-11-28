class Tukurepo < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user

  has_attached_file :image, styles: { medium: "120x120>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :message, presence: true
end
