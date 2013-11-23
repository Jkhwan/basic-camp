class Project < ActiveRecord::Base
  has_many :users, through: :participants
  has_many :participants, dependent: :destroy
  has_many :todos
  has_many :discussions

  validates :name, :description, presence: true

  after_create :add_owner_as_participant

  protected

  def add_owner_as_participant
    @particiant = Participant.create(project_id: self.id, user_id: self.owner_id)
  end
end
