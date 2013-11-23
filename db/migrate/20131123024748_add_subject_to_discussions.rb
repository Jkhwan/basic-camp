class AddSubjectToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :subject, :string
    add_column :discussions, :content, :text
  end
end
