class SubscriptionCharge

  PLAN_AMOUNT = 800

  def initialize(sub)
    @subscription = sub
  end

  Stripe.api_key = "sk_test_3ZATQU9gTIrSVcbGre3Ce6ZH"

  def charge!
    begin
      result = Stripe::Charge.create(
                 amount: PLAN_AMOUNT,
                 currency: "cad",
                 customer: @subscription.user.customer_token
               )
      @subscription.last_payment_date = Date.today
      @subscription.next_payment_date = @subscription.next_payment_date.advance(months: 1)
      @subscription.payments.create(amount: PLAN_AMOUNT, paid_at: Time.now)
    rescue Stripe::CardError => e
      # TODO: SEND FAILURE EMAIL
    end
  end
end
