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
    create_user_and_login
    expect(page).to have_content 'Welcome back'
  end

  scenario "logout successfully" do
    create_user_and_login
    click_link "Logout"
    expect(page).to have_content "Log into"
  end
  
end