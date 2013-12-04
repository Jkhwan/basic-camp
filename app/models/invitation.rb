class Invitation < ActiveRecord::Base
  default_value_for :token do
    loop do
      random_token = SecureRandom.hex
      break random_token unless Invitation.exists?(token: random_token)
    end
  end

  belongs_to :project
  belongs_to :inviter, class_name: :User

  validates :email, presence: true, uniqueness: { scope: :project_id }
  validates :project, presence: true
  validates :token, presence: true
  validates :inviter, presence: true

  after_create :send_email

  protected
  def send_email
    UserMailer.invitation_to_project_email(self).deliver
  end
end
