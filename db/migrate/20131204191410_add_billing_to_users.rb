class AddBillingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :noc, :string
    add_column :users, :cc_number, :string
    add_column :users, :cc_type, :string
    add_column :users, :exp, :date
    add_column :users, :street, :string
    add_column :users, :province, :string
    add_column :users, :postal, :string
    add_column :users, :country, :string
  end
end
