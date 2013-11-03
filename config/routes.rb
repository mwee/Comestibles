ExampleStore::Application.routes.draw do
  
  resources :groups

  resources :carts do
  	resources :categories, only: [:show, :index]
  end

  resources :line_items
  resources :categories
  resources :orders
  resources :products
  resources :sessions
  resources :users

  #copied from railscast 250 - 270
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  get "welcome" => "welcome#index", :as => "welcome"
  root :to => "welcome#index"

  post "carts/:id/finalize" => "carts#finalize", :as => "finalize_cart"

  get '/return'=>'carts#return'

  get '/notification' => 'orders#notification'

  get 'orders/:id/refund' => 'orders#refund', :as => 'refund'

  post 'groups/:id' => 'groups#add_group_member', :as => 'add_group_member'

  # root :to => 'categories#show', :id => 1
  # root :to => 'carts#index'

end
