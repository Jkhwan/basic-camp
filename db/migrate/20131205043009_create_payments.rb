class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :subscription, index: true
      t.integer :amount
      t.datetime :paid_at

      t.timestamps
    end
  end
end
