class User < ActiveRecord::Base
  has_many :projects, through: :participants
  has_many :participants
  has_many :discussions
  has_many :messages
  has_one :subscription

  mount_uploader :avatar, AvatarUploader
  has_secure_password

  validates :username, uniqueness: { case_sensitive: false }, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true, email: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { in: 6..20 }, on: :create
  validates :noc, presence: true, if: "paid"
  validates :cc_token, presence: true, if: "paid"
  validates :cc_type, presence: true, if: "paid"
  validates :exp, presence: true, if: "paid"
  validates :street, presence: true, if: "paid"
  validates :province, presence: true, if: "paid"
  validates :postal, presence: true, if: "paid"
  validates :country, presence: true, if: "paid"

  def full_name
    "#{first_name} #{last_name}".strip
  end

end
