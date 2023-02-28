Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#index'

  delete '/logout', to: 'login#destroy'
  post '/auth/google_oauth2/callback', to: 'login#create'
  post '/login', to: 'login#create'

  get '/search', to: 'search#index'

  resource :dashboard, except: [:new, :index, :create], controller: 'users'

  get '/onboarding', to: 'login#edit'
  patch '/onboarding', to: 'login#update'

  resources :media, only: [:show]
end
