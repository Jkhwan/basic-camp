require 'spec_helper'

describe SubscriptionsController do

  before :each do
    @user = FactoryGirl.create :user
    session[:user_id] = @user.id
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
    it "should assigns a new subscription to @subscription" do
      get 'new'
      expect(assigns[:subscription]).to be_a_new(Subscription)
    end
    it "should redirect to log in page if user is not signed in" do
      session[:user_id] = nil
      get 'new'
      expect(response).to redirect_to(sessions_path)
    end
  end

  describe "POST 'create'" do
    before :each do
      allow_any_instance_of(Subscription).to receive(:start_subscription)
    end
    it "redirects to projects page on success" do
      post 'create'
      expect(response).to redirect_to projects_path
    end
    it "assigns token to user.token" do
      post 'create', token: "123456"
      @user.reload
      expect(@user.customer_token).to eq("123456")
    end
    it "renders new on failure" do
      Subscription.any_instance.stub(:save).and_return(false)
      post 'create', token: "123456"
      expect(response).to render_template(:new)
    end
    it "updates current_user's paid field"
  end
end
