class DeleteDirectUploadUrlFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :image_processing, :boolean
    remove_column :recipes, :direct_upload_url, :string
  end
end
