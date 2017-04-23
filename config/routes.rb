Rails.application.routes.draw do
  root to: 'home#index'

    get '/auth/facebook/callback', to: 'sessions#create_facebook'
    get '/auth/failure', to: redirect('/')

  get '/login', to: 'sessions#new', as: "login"
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users


  resources :trips do
    resources :todos
  end

  namespace :api do
    namespace :v1 do
      resources :countries
    end
  end
end
