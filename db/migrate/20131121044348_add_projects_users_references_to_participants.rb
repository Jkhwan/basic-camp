class AddProjectsUsersReferencesToParticipants < ActiveRecord::Migration
  def change
    add_reference :participants, :project, index: true
    add_reference :participants, :user, index: true
  end
end
