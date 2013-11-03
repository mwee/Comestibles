ExampleStore::Application.routes.draw do
  
  resources :carts do
  	resources :categories, only: [:show, :index]
  end

  resources :line_items
  resources :categories
  resources :orders
  resources :products
  resources :sessions
  resources :users
  resources :bills

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

  # root :to => 'categories#show', :id => 1
  # root :to => 'carts#index'

end
