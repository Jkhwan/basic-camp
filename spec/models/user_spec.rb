require 'spec_helper'

describe User do

  before :each do 
    @user = FactoryGirl.build :user
  end
  
  describe '#full_name' do
    it "returns the user's fullname" do
      expect(@user.full_name).to eq("Khurram Virani")
    end

    it "returns the user's firstname if lastname is not provided" do
      @user.last_name = nil
      expect(@user.full_name).to eq("Khurram")
    end

    it "returns the user's lastname if firstname is not provided" do
      @user.first_name = nil
      expect(@user.full_name).to eq("Virani")
    end
  end

  describe 'username' do
    it "should fail if username is not provided" do
      @user.username = nil
      expect(@user.valid?).to eq(false)
    end

    it "should fail if username already exists regardless of case" do
      @user.save
      user1 = FactoryGirl.build :user, username: @user.username.upcase
      expect(user1.save).to eq(false)
    end
  end

  describe 'email' do
    it "should fail if email is not provided" do
      @user.email = nil
      expect(@user.valid?).to eq(false)
      expect(@user.errors[:email].first).to eq("can't be blank")
    end

    it "should fail if email already exists regardless of case" do
      @user.save
      user1 = FactoryGirl.build :user, email: @user.email.upcase
      user1.save
      expect(user1.errors[:email].first).to eq("has already been taken")
    end

    it "should fail if email is invalid" do
      @user.email = "kvirani@"
      expect(@user.save).to eq(false)
      expect(@user.errors[:email].first).to eq("is invalid")
    end
  end

  describe 'password' do
    it "should fail if password is less than 6 digits" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      expect(@user.save).to eq(false)
      expect(@user.errors[:password].first).to eq("is too short (minimum is 6 characters)")
    end    

    it "should fail if password is more than 20 digits" do
      @user.password = "123456789012345678901"
      @user.password_confirmation = "123456789012345678901"
      expect(@user.save).to eq(false)
      expect(@user.errors[:password].first).to eq("is too long (maximum is 20 characters)")
    end

    it "should work if password is between 6 and 20 digits" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user.save).to eq(true)
    end

    it "should fail if password doesn't match with password confirmation" do
      @user.password = "123456"
      @user.password_confirmation = "654321"
      expect(@user.save).to eq(false)
      expect(@user.errors[:password_confirmation].first).to eq("doesn't match Password")
    end

    it "should fail if password confirmation is not provided" do
      @user.password_confirmation = nil
      expect(@user.save).to eq(false)
      expect(@user.errors[:password_confirmation].first).to eq("can't be blank")
    end
  end

  describe 'Billing Information' do
    context "Subscription" do
      it "returns false for new user" do
        @user = FactoryGirl.build :user
        expect(@user.paid).to eq(false)
      end
    end
    context "Validation" do
      let(:user) { FactoryGirl.build :user }
      it "is invalid if name on card is empty and paid is true" do
        user.paid = true
        expect(user).to_not be_valid
        expect(user.errors[:noc].first).to eq("can't be blank")
      end
      it "is valid if name on card is empty and paid is false" do
        expect(user).to be_valid
      end
    end
  end
end
