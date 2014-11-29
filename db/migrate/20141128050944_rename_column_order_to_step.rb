class RenameColumnOrderToStep < ActiveRecord::Migration
  def change
    rename_column :directions, :order, :step
  end
end
