class AddDiscussionToMessages < ActiveRecord::Migration
  def change
    add_reference :messages, :discussion, index: true
  end
end
