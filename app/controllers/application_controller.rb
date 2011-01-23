class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :set_layout


  protected
  def set_layout
    (request.subdomains.first == "m" && is_mobile_device?) ? "smartphone" : "application"
  end

  def redirect_back_or_default
    redirect_to(request.request_uri || root_url)
  end
end

