class User < ActiveRecord::Base
  has_many :projects, through: :participants
  has_many :participants

  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { in: 6..20 }, on: :create

  def full_name
    "#{first_name} #{last_name}"
  end

end
