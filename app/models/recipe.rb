class Recipe < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: { draft: 'draft', published: 'published' }, default: :draft

  belongs_to :user
  has_many :ingredients
  has_many :directions
  has_many :tukurepos

  accepts_nested_attributes_for :ingredients, allow_destroy: true,
    reject_if: proc { |attributes| attributes['title'].blank? }
  accepts_nested_attributes_for :directions, allow_destroy: true,
    reject_if: proc { |attributes| attributes['description'].blank? }
  accepts_nested_attributes_for :tukurepos, allow_destroy: true,
    reject_if: proc { |attributes| attributes['message'].blank? }

  has_attached_file :image, styles: { medium: "280x420>", thumb: "140x210>" },
    default_url: "no-image.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :published, -> { where(status: :published) }

  def build_child_items
    if self.ingredients.empty?
      3.times { self.ingredients.build }
    end

    if self.directions.empty?
      (1..4).each { |i| self.directions.create(step: i) }
    end

    #steps = self.directions.pluck(:step)
    #(1..4).each do |i|
    #  self.directions.build(step: i) unless steps.include?(i)
    #end
  end
end
