class RemoveUserFromMessages < ActiveRecord::Migration
  def change
    remove_reference :messages, :User, index: true
  end
end
