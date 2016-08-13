Rails.application.routes.draw do
  get 'users/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback', to: 'sessions#create'
  root 'sessions#new'
  resources :tweets
end
