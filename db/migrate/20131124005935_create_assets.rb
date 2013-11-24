class CreateAssets < ActiveRecord::Migration
  def change
    drop_table :assets
    
    create_table :assets do |t|
      t.references :project, index: true
      t.integer :user_id
      t.string :avatar

      t.timestamps
    end
  end
end
