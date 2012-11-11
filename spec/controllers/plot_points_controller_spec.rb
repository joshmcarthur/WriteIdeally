require 'spec_helper'

describe PlotPointsController do

  # This should return the minimal set of attributes required to create a valid
  # PlotPoint. As you add validations to PlotPoint, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    FactoryGirl.attributes_for(:plot_point)
  end

  let(:plot_point) { FactoryGirl.create(:plot_point) }


  describe "GET index" do
    it "assigns all plot_points as @plot_points" do
      plot_point
      get :index, {}
      assigns(:plot_points).should eq([plot_point])
    end

    it "renders the correct template" do
      get :index
      response.should render_template 'index'
    end
  end

  describe "GET show" do
    it "assigns the requested plot_point as @plot_point" do
      get :show, {:id => plot_point.to_param}
      assigns(:plot_point).should eq(plot_point)
    end

    it "should render the correct template" do
      plot_point
      get :show, {:id => plot_point.to_param }
      response.should render_template 'show'
    end
  end

  describe "POST create" do
    it "creates a new PlotPoint" do
      expect {
        post :create, :format => :js
      }.to change(PlotPoint, :count).by(1)
    end

    it "assigns a newly created plot point as @plot_point" do
      post :create, :format => :js
      assigns(:plot_point).should be_persisted
    end

    it "renders the correct template" do
      post :create, :format => :js
      response.should render_template :create
    end

    context "title is provided" do
      it "sets the title attribute to what was passed in" do
        post :create, {:format => :js, :plot_point => {:title => "Test Title"}}
        assigns(:plot_point).title.should eq "Test Title"
      end
    end

    context "title is not provided" do
      it "sets the title to a default" do
        post :create, :format => :js
        assigns(:plot_point).title.should eq I18n.t('plot_points.defaults.title')
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested plot_point" do
        plot_point
        PlotPoint.any_instance.should_receive(:update_attributes).with({'title' => 'Updated Title'})
        put :update, {:id => plot_point.to_param, :plot_point => {'title' => 'Updated Title'}}
      end

      it "assigns the requested plot_point as @plot_point" do
        plot_point = PlotPoint.create! valid_attributes
        put :update, {:id => plot_point.to_param, :plot_point => valid_attributes}
        assigns(:plot_point).should eq(plot_point)
      end

      it "redirects to the plot_point" do
        plot_point = PlotPoint.create! valid_attributes
        put :update, {:id => plot_point.to_param, :plot_point => valid_attributes}
        response.should redirect_to(plot_point)
      end
    end

    describe "with invalid params" do
      it "assigns the plot_point as @plot_point" do
        plot_point = PlotPoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PlotPoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => plot_point.to_param, :plot_point => {}}
        assigns(:plot_point).should eq(plot_point)
      end

      it "re-renders the 'edit' template" do
        plot_point = PlotPoint.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PlotPoint.any_instance.stub(:save).and_return(false)
        put :update, {:id => plot_point.to_param, :plot_point => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested plot_point" do
      plot_point = PlotPoint.create! valid_attributes
      expect {
        delete :destroy, {:id => plot_point.to_param}
      }.to change(PlotPoint, :count).by(-1)
    end

    it "redirects to the plot_points list" do
      plot_point = PlotPoint.create! valid_attributes
      delete :destroy, {:id => plot_point.to_param}
      response.should redirect_to(plot_points_url)
    end
  end

end
