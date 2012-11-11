WriteIdeally::Application.routes.draw do

  resources :plot_points
  resources :projects, :only => [:show, :create, :update, :destroy] do
  	get :trial, :on => :collection
  end

  devise_for :users

  authenticated :user do
  	root :to => 'projects#default'
  end

  root :to => 'projects#trial'

end