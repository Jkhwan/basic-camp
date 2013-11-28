require 'spec_helper'

feature "Project" do
  scenario "succeeds to create a new project" do
    create_user_and_login
    create_project
    expect(page).to have_content "Project was created"
  end

  scenario "fails to create a new project" do
    create_user_and_login
    create_project("", "Short description")
    expect(page).to have_content "can't be blank"
  end

  scenario "opens an individual project page properly" do
    create_user_and_login
    create_project
    click_link "View"
    expect(page).to have_content "Project Home"
  end

  scenario "succeeds to delete a project" do
    create_user_and_login
    create_project
    find(:xpath, "//p//a[@data-method='delete']").click
        puts page.html
    expect(page).to have_content "Project was deleted"
  end
end