Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  delete '/logout', to: 'session#destroy'
  post '/auth/google_oauth2/callback', to: 'session#create'
  post '/login', to: 'session#create'
  get '/onboarding', to: 'session#edit'
  patch '/onboarding', to: 'session#update'

  get '/search', to: 'search#index'

  resource :dashboard, except: [:new, :index, :create], controller: 'users'

  resources :media, only: [:show]
end
