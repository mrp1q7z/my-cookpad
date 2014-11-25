class RemoveImagePathFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :image_path, :string
  end
end
