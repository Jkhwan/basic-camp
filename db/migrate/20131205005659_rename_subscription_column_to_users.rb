class RenameSubscriptionColumnToUsers < ActiveRecord::Migration
  def change
    rename_column :users, :subscription, :paid
  end
end
