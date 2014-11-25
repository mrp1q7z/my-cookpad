class Direction < ActiveRecord::Base
  belongs_to :recipe

  has_attached_file :image, styles: { medium: "210x140>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
