class SearchController < ApplicationController
  before_filter :authenticate_user!
  def new
    respond_to do |wants|
      wants.html
      wants.js
    end
  end

  def search
    begin
      class_to_search = params[:klass].classify.constantize
      raise NameError unless class_to_search.respond_to?(:search)
      if class_to_search.respond_to?(:paginate)
        @results = class_to_search.search(params[:terms]).paginate :page => params[:page], :per_page => 10
      else
        @results = class_to_search.search(params[:terms])
      end
      respond_to do |wants|
        wants.html
        wants.js
      end
    rescue NameError
      #Class not found, return 404
      render :text => "Sorry, but you can't search #{params[:klass]}", :status => 404
    end
  end
end

