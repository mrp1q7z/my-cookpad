class CreateEmailMagazines < ActiveRecord::Migration
  def change
    create_table :email_magazines do |t|
      t.string :title

      t.timestamps
    end
  end
end
