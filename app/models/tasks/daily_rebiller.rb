class Tasks::DailyRebiller
  def run
    Subscription.requires_rebill.find_each(batch_size: 500) do |s|
      SubscriptionCharge.new(s).charge!  
    end
  end

  # def find_subscriptions_for_billing 
  #   Subscription.where("last_payment_date <= ?", one_month_ago)
  # end

  # def one_month_ago
  #   Date.today.advance(months: -1)
  # end
end
