class ChangeColumnNameFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :cc_number, :string
    add_column :users, :cc_token, :string
  end
end
