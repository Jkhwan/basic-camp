class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.references :project, index: true
      
      t.timestamps
    end
  end
end
