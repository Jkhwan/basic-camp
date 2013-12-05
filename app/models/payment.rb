class Payment < ActiveRecord::Base
  belongs_to :subscription
  validates :subscription, presence: true
  validates :amount, presence: true, numericality: true
  validates :paid_at, presence: true
end
