require 'grape/api'
require 'ruby-debug'

module Writeideally
  class API < Grape::API
    version "v1"
    prefix  "api"

    error_format :json
    rescue_from :all

    helpers do
      def current_user
        @current_user ||= User.first
      end

      def authenticate!
        error!('Unauthenticated', 401) unless current_user
      end

    end

    resource "ideas" do
      get do
        @ideas = Idea.paginate :page => params[:page], :per_page => params[:per_page]
        {
          :pagination => {
            :page => @ideas.current_page,
            :total_pages => @ideas.total_pages
          },
          :collection => @ideas
        }
      end

      get ':id' do
        Idea.find(param[:id])
      end
    end
  end
end
