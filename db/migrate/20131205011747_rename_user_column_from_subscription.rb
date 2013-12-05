class RenameUserColumnFromSubscription < ActiveRecord::Migration
  def change
    rename_column :subscriptions, :User_id, :user_id
  end
end
