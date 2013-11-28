def create_user_and_login    
  user = FactoryGirl.create :user
  visit '/login'
  fill_in 'username', with: user.username
  fill_in 'password', with: user.password
  click_button 'Log In'
end

def create_project(name = nil, description = nil)
  click_link "Add New"
  project = FactoryGirl.build :project
  fill_in 'project[name]', with: (name || project.name)
  fill_in 'project[description]', with: (description || project.description)
  click_button "Create Project"
  project
end