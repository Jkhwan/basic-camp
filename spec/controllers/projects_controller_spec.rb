require 'spec_helper'

describe ProjectsController do

  render_views

  let(:project) { FactoryGirl.create :project, owner: @user }

  before :each do
    @user = FactoryGirl.create :user
    session[:user_id] = @user.id
  end

  context "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response.body).to match(/Add new project/)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "loads to the projects into @projects" do
      project1 = FactoryGirl.create :project, owner: @user
      project2 = FactoryGirl.create :project, owner: @user
      get :index
      expect(assigns(:projects)).to match_array([project1, project2])
    end
  end

  context "GET 'show'" do

    it "returns http success" do
      get :show, id: project.id
      expect(response).to be_success
    end

    it "renders the show template" do
      get :show, id: project.id
      expect(response).to render_template(:show)
    end

    it "loads discussions of this project to @discussions" do
      discussion = FactoryGirl.create :discussion, project: project, user: @user
      get :show, id: project.id
      expect(assigns(:discussions)).to match_array([discussion])
    end

    it "loads todos of this project to @todos" do
      todo = FactoryGirl.create :todo, project: project
      get :show, id: project.id
      expect(assigns(:todos)).to match_array([todo])
    end

    it "loads assets of this project to @assets" do
      asset = FactoryGirl.create :asset, project: project, user: @user
      get :show, id: project.id
      expect(assigns(:assets)).to match_array([asset])
    end

  end

  context "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context "DELETE 'destroy'" do

    it "deletes the project" do
      project
      count = Project.count
      delete :destroy, id: project.id
      expect(Project.count).to eq(count-1)
    end

    it "redirects to projects index page" do
      delete :destroy, id: project.id
      expect(response).to redirect_to(projects_path)
    end
  end

  context "GET 'edit'" do

    it "returns http success" do
      get :edit, id: project.id
      expect(response).to be_success
    end

    it "renders the edit page" do
      get :edit, id: project.id
      expect(response).to render_template(:edit)
    end
  end

  context "POST 'create'" do
    it "redirects to projects index page on success" do
      post :create, project: FactoryGirl.attributes_for(:project)
      expect(assigns(:project)).to be_a(Project)
      expect((assigns(:project)).owner).to eq(@user)
      expect(response).to redirect_to(projects_path)
    end

    it "renders the new page on failure" do
      post :create, project: FactoryGirl.attributes_for(:project, name: nil)
      expect(assigns(:project)).to be_a_new(Project)
      expect(response).to render_template(:new)
    end
  end

  context "PUT 'update'" do
    it "redirects to project show page on success" do
      put :update, id: project.id, project: FactoryGirl.attributes_for(:project)
      expect((assigns(:project)).owner).to eq(@user)
      expect(response).to redirect_to(project_path(project))
    end

    it "renders edit page on failure" do
      put :update, id: project.id, project: FactoryGirl.attributes_for(:project, name: nil)
      expect((assigns(:project)).name).to eq(nil)
      expect(response).to render_template(:edit)
    end
  end
end

