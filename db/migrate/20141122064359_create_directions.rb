class CreateDirections < ActiveRecord::Migration
  def change
    create_table :directions do |t|
      t.integer :recipe_id
      t.string :description
      t.integer :order

      t.timestamps
    end
  end
end
