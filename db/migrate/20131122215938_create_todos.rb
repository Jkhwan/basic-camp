class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :name
      t.datetime :due_date
      t.integer :importance
      t.boolean :completed
      t.references :project, index: true

      t.timestamps
    end
  end
end
