class CreateTukurepos < ActiveRecord::Migration
  def change
    create_table :tukurepos do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :message

      t.timestamps
    end
  end
end
