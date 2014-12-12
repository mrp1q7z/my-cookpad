class AddUploadUrlToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :image_processing, :boolean, default: true
    add_column :recipes, :direct_upload_url, :string
  end
end
