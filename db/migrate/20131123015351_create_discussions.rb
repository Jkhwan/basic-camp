class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.string :name
      t.references :project, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
