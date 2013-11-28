require 'spec_helper'

feature "Registration" do
  
  scenario "fails with existing email" do
    u = FactoryGirl.create :user, username: :khurram
    visit '/'
    fill_in 'user[username]', with: :khurram
    fill_in 'user[email]', with: "kv@gmail.com"
    fill_in 'user[first_name]', with: "Khurram"
    fill_in 'user[last_name]', with: "Virani"
    fill_in 'user[password]', with: "lighthouselabs"
    fill_in 'user[password_confirmation]', with: "lighthouselabs"
    click_button 'Get Started'
    expect(page).to have_content 'Username has already been taken'
  end

  scenario "succeeds with valid fields" do
    u = FactoryGirl.create :user, username: :khurram
    visit '/'
    fill_in 'user[username]', with: "kvirani"
    fill_in 'user[email]', with: "kv@gmail.com"
    fill_in 'user[first_name]', with: "Khurram"
    fill_in 'user[last_name]', with: "Virani"
    fill_in 'user[password]', with: "lighthouselabs"
    fill_in 'user[password_confirmation]', with: "lighthouselabs"
    click_button 'Get Started'
    expect(page).to have_content 'Welcome to Basic Camp,'
  end

end