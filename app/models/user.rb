class User < ActiveRecord::Base
  has_many :projects, through: :participants
  has_many :participants
  has_many :discussions
  has_many :messages

  mount_uploader :avatar, AvatarUploader
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { in: 6..20 }, on: :create

  def full_name
    "#{first_name} #{last_name}".strip
  end

end
