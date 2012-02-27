Writeideally::Application.routes.draw do

  devise_for :users
  devise_for :admin_users

  # The priority is based upon order of creation:
  # first created -> highest priority
  resources :help, :except => [:show, :edit, :update, :destroy]
  match 'help/show/*stub' => 'help#show', :via => :get, :as => 'show_help'
  match 'help/:id/edit' => 'help#edit', :via => :get, :as => 'edit_help'
  match 'help/:id' => 'help#update', :via => :put, :as => 'help'
  match 'help/:id/delete' => 'help#destroy', :via => :get, :as => 'destroy_help'
  resources :invitations, :only => [:create]
  resources :ideas do
    member do
      get 'print'
    end
  end

  match 'ideas/:id/destroy' => 'ideas#destroy', :as => 'delete_idea'
  match 'search/:klass/new' => 'search#new', :as => 'new_search'
  match 'search/:klass' => 'search#search', :as => 'search'
  match 'about' => 'about#show'
  match 'contact' => 'about#contact', :via => :post

  mount Writeideally::API => "/"

  root :to => "dashboard#index"
end

