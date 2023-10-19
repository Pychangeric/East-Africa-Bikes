Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  get '/login' => 'clearance/sessions#new', as: 'login'
  post '/login' => 'clearance/sessions#create'
  delete '/logout' => 'clearance/sessions#destroy', as: 'logout'
end
