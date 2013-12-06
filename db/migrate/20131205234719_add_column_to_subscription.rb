class AddColumnToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :next_payment_date, :date
  end
end
