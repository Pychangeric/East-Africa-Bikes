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

# Rails.application.routes.draw do
#   root to: 'application#placeholder'

#   # Clearance routes
#   resources :users, only: [:new, :create, :destroy]
#   get '/login' => 'clearance/sessions#new', as: 'login'
#   post '/signup' => 'clearance/sessions#create'
#   delete '/logout' => 'clearance/sessions#destroy', as: 'logout'

#   # Admin namespace routes
#   namespace :admin do
#     resources :users  # Define routes for user management
#     # Add more admin-specific routes as needed
#   end

#   # Bikes routes
#   resources :bikes

#   # Reviews routes
#   resources :reviews

#   # Comments routes
#   resources :comments

#   # Categories routes
#   resources :categories

#   # Accessories routes
#   resources :accessories

#   # Orders routes
#   resources :orders

#   # OrderItems routes
#   resources :order_items, only: [:create, :update, :destroy]

#   # Favorites routes
#   resources :favorites, only: [:create, :destroy]

#   # Cart routes
#   resources :carts, only: [:show, :update, :destroy]

#   # Images routes
#   resources :images

#   # Ratings routes
#   resources :ratings

#   # Specifications routes
#   resources :specifications

#   # Events routes
#   resources :events, only: [:show, :index]
# end
