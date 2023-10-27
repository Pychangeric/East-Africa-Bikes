Rails.application.routes.draw do
  root to: 'application#placeholder'
  resources :users, only: [:new, :create, :delete]
  get '/login' => 'clearance/sessions#new', as: 'login'
  post '/signup' => 'clearance/sessions#create'
  delete '/logout' => 'clearance/sessions#destroy', as: 'logout'

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/destroy'
    resources :users  # Define routes for user management
    # Add more admin-specific routes as needed
  end

  resources :events, only: [:show, :index]

end
