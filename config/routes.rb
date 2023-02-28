Rails.application.routes.draw do
  root 'landing#index'

  post '/auth/google_oauth2/callback', to: 'session#create'
  post '/login', to: 'session#create'
  get '/onboarding', to: 'session#edit'
  patch '/onboarding', to: 'session#update'
  delete '/logout', to: 'session#destroy'

  get '/search', to: 'search#index'

  resource :dashboard, except: [:new, :index, :create], controller: 'users'

  resources :media, only: [:show]
end
