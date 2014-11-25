class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions, id: false do |t|
      t.references :user, index: true, null: false
      t.references :email_magazine, index: true, null: false
      t.boolean :accept
    end
  end
end
