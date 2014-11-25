class DropJoinTableUserEmailMagazine < ActiveRecord::Migration
  def change
    drop_join_table :users, :email_magazines
  end
end
