Rails.application.routes.draw do
  get 'reservation/index'
  get 'welcome/index'
  root 'welcome#index'
    resources :movies
  post 'movie_create' => 'movies#create'

    # post 'update_movie' => 'movie#update_issues'
    # post 'create_movie' => 'movie#index'
    # get 'home_controller/index'
    # get 'home' => 'home#index'
    # get 'export_trace_in_site' => 'export_trace_in_site#index'
end
