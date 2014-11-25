class CreateJoinTableUserEmailMagazine < ActiveRecord::Migration
  def change
    create_join_table :users, :email_magazines do |t|
      # t.index [:user_id, :email_magazine_id]
      # t.index [:email_magazine_id, :user_id]
    end
  end
end
