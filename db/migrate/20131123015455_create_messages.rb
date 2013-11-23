class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :content
      t.references :Discussion, index: true
      t.references :User, index: true

      t.timestamps
    end
  end
end
