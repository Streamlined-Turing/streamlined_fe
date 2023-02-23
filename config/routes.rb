Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  get '/login', to: 'login#index'
  get '/auth/google_oauth2', as: :google_login
  get '/auth/google_oauth2/callback', to: 'login#create'

  get '/search', to: 'search#index'
end
