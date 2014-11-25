class AddAttachmentImageToDirections < ActiveRecord::Migration
  def self.up
    change_table :directions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :directions, :image
  end
end
