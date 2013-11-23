class ChangeDataTypeForTodosDueDate < ActiveRecord::Migration
  def change
    change_table :todos do |t|
      t.change :due_date, :date
    end
  end
end
