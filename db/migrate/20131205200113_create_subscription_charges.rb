class CreateSubscriptionCharges < ActiveRecord::Migration
  def change
    create_table :subscription_charges do |t|

      t.timestamps
    end
  end
end
