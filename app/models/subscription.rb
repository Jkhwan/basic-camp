class Subscription < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :start_date, presence: true
end
