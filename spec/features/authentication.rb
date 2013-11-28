require 'spec_helper.rb'

feature "Authentication" do

  scenario "fails with incorrect credentials" do
    visit '/login'
    fill_in 'username', with: "jason"
    fill_in 'password', with: "basic123"
    click_button 'Log In'
    expect(page).to have_content 'Log in failed'
  end

  scenario "succeeds with correct credentials" do
    u = FactoryGirl.create :user
    visit '/login'
    fill_in 'username', with: u.username
    fill_in 'password', with: u.password
    click_button 'Log In'
    expect(page).to have_content 'Welcome back'
  end
  
end