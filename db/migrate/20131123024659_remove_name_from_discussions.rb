class RemoveNameFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :name, :string
  end
end
