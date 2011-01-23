class DashboardController < ApplicationController

  before_filter :authenticate_user!, :only => :authenticated

  def index
    if current_user
      redirect_to ideas_url
    else
      redirect_to new_user_registration_url
    end
  end

  def anonymous
  end

  def authenticated
  end

  def about
  end
end

