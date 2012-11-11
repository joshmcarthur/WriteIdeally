WriteIdeally::Application.routes.draw do
  resources :plot_points

  devise_for :users

  root :to => 'pages#home'
end