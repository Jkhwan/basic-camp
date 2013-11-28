class Invitation < ActiveRecord::Base
  belongs_to :project

  validates :email, presence: true, uniqueness: { scope: :project_id }
  validates :project, presence: true
  validates :token, presence: true
end
