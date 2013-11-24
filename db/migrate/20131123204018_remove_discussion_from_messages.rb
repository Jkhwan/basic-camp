class RemoveDiscussionFromMessages < ActiveRecord::Migration
  def change
    remove_reference :messages, :Discussion, index: true
  end
end
