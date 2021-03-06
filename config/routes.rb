Rails.application.routes.draw do
  root to: 'home#index'

  get '/auth/google_oauth2/callback', to: 'sessions#create_google'
  get '/auth/google_oauth2',          as: :login

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
