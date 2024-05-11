Rails.application.routes.draw do
  resources :websites
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do

    post '/register', to: 'users#create'
    post '/login', to: 'sessions#create'
    post '/logout', to: 'sessions#destroy'

    get '/websites', to: 'websites#index'
    post '/websites/add', to: 'websites#create'
    delete '/websites/delete/:id', to: 'websites#destroy'

    post '/activity', to: 'activity#log_activity'
    get '/activity/summary', to: 'activity#activity_summary'

    get '/blacklist', to: 'blacklist#index'
    post '/blacklist/add', to: 'blacklist#add_to_blacklist'
    delete '/blacklist/delete/:id', to: 'blacklist#remove_from_blacklist'
    get '/blacklist/check', to: 'blacklist#check_blacklist'

    get '/notifications', to: 'notifications#index'
    post '/notifications/add', to: 'notifications#add_notification'
    delete '/notifications/delete/:id', to: 'notifications#remove_notification'
    get '/notifications/check', to: 'notifications#check_notification'

    get '/reports/daily', to: 'reports#daily'
    get '/reports/weekly', to: 'reports#weekly'
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
