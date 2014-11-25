class AddAttachmentImageToTukurepos < ActiveRecord::Migration
  def self.up
    change_table :tukurepos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :tukurepos, :image
  end
end
