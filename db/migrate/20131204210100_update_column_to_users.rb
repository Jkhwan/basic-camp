class UpdateColumnToUsers < ActiveRecord::Migration
  def up
    change_column :users, :subscription, :boolean, default: false
  end
end
