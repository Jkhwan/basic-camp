class Subscription < ActiveRecord::Base

  # Associations
  belongs_to :user
  has_many :payments

  # Callback
  before_create :start_subscription

  # Default values
  default_value_for :start_date do
    Date.today
  end

  default_value_for :next_payment_date do
    Date.today.advance(months: 1)
  end

  # Scope
  scope :requires_rebill, -> { Subscription.where("last_payment_date <= ?", Date.today.advance(months: -1)) }
  
  # Validations
  validates :user, presence: true
  validates :start_date, presence: true

  protected

  def start_subscription
    p = SubscriptionCharge.new(self).charge!
    unless p
      errors.add :base, "Failed payment"
      return false
    end
  end
end
