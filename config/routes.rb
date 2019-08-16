Rails.application.routes.draw do
  get 'test/index'
    # root :to => 'welcome#index', :as => 'home'
    # root :to => 'movies#index', :as => 'home'

    resources :movies
    # post 'update_movie' => 'movie#update_issues'
    # post 'create_movie' => 'movie#index'
    # get 'home_controller/index'
    # get 'home' => 'home#index'
    # get 'export_trace_in_site' => 'export_trace_in_site#index'
end
