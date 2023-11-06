Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password, controller: "clearance/passwords", only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  root to: 'application#placeholder'
  resources :users, only: [:new, :create, :delete]
  get '/login' => 'clearance/sessions#new', as: 'login'
  post '/signup' => 'clearance/sessions#create'

  # Comment out or remove the following line to avoid conflicts:
  # delete '/logout' => 'clearance/sessions#destroy', as: 'logout'

  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'

    delete 'users/logout' => 'users#logout', as: 'admin_logout'

    
    resources :users
    # Add more admin-specific routes as needed
  end

  resources :events, only: [:show, :index]
end
