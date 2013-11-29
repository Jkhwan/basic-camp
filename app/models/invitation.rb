class Invitation < ActiveRecord::Base
  belongs_to :project

  validates :email, presence: true, uniqueness: { scope: :project_id }
  validates :project, presence: true
  validates :token, presence: true

  after_create :send_email

  protected
  def send_email
    UserMailer.invitation_to_project_email(self).deliver
  end
end
