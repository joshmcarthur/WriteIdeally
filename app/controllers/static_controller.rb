class StaticController < ApplicationController
  def index
    if params[:id]
      render :template => id.to_s
    end

    render  
  end  

end
