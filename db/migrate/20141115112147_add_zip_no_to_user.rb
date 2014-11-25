class AddZipNoToUser < ActiveRecord::Migration
  def change
    add_column :users, :zip_code, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :sex, :integer
  end
end
