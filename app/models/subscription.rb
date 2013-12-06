class Subscription < ActiveRecord::Base
  belongs_to :user
  has_many :payments

  default_value_for :start_date do
    Date.today
  end

  default_value_for :next_payment_date do
    Date.today.advance(months: 1)
  end

  validates :user, presence: true
  validates :start_date, presence: true
end
