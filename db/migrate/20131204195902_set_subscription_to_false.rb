class SetSubscriptionToFalse < ActiveRecord::Migration
  def up
    User.update_all(subscription: false)
  end
end
