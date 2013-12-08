class SubscriptionsController < ApplicationController
  
  before_action :restrict_access

  def new
    @subscription = Subscription.new
  end

  def create
    current_user.customer_token = params[:token]

    @subscription = current_user.build_subscription
    if @subscription.save
      current_user.save
      redirect_to projects_path
    else
      render :new
    end
  end
end
