ExampleStore::Application.routes.draw do
  
  # resources :carts do
  # 	resources :categories, only: [:show, :index]
  # end

  # resources :carts do
  #    resources :items
  # end


  resources :groups do
    resources :carts do
      resources :items
    end
  end

  # resources :carts do
  # 	resources :categories, only: [:show, :index]
  # end

  # resources :line_items
  # resources :categories
  resources :orders
  # resources :products
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

  post 'groups/:id' => 'groups#add_group_member', :as => 'add_group_member'
  # get 'groups/:id/carts' => 'groups#carts', :as => 'group_carts'

  # root :to => 'categories#show', :id => 1
  # root :to => 'carts#index'

  post 'bills/:id/status_paid' => 'bills#status_paid', :as => 'status_paid'

end
