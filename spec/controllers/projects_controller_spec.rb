require 'spec_helper'

describe ProjectsController do

  let(:project) { FactoryGirl.create(:project) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:project) }

 describe "POST create" do
    it "creates a new Project" do
      expect {
        post :create, :format => :js
      }.to change(Project, :count).by(1)
    end

    it "assigns a newly created plot point as @project" do
      post :create, :format => :js
      assigns(:project).should be_persisted
    end

    it "renders the correct template" do
      post :create, :format => :js
      response.should render_template :create
    end

    context "name is provided" do
      it "sets the name attribute to what was passed in" do
        post :create, {:format => :js, :project => {:name => "Test name"}}
        assigns(:project).name.should eq "Test name"
      end
    end

    context "name is not provided" do
      it "sets the name to a default" do
        post :create, :format => :js
        assigns(:project).name.should eq I18n.t('projects.defaults.name')
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested project" do
        project
        expect {
          put :update, {:id => project.to_param, :project => {'name' => 'Updated name'}}
          project.reload
        }.to change(project, :name)
      end

      it "assigns the requested project as @project" do
        project
        put :update, {:id => project.to_param, :project => valid_attributes}
        assigns(:project).should eq(project)
      end

    end
  end


end
