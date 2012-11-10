require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end

    it "renders the home template" do
      get :home
      response.should render_template :home
    end
  end

end
