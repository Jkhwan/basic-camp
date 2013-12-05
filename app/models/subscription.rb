class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :payments

  validates :user, presence: true
  validates :start_date, presence: true
end
