class Participant < ActiveRecord::Base
  # Associations
  belongs_to :user
  belongs_to :project

  # Validations
  validates :user, presence: true, uniqueness: { scope: :project_id }
  validates :project, presence: true
end
