ExampleStore::Application.routes.draw do
  
  resources :groups do
    resources :carts do
      resources :items
    end
  end

  resources :sessions
  resources :users
  resources :bills

  #copied from railscast 250 - 270
  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  
  get "welcome" => "welcome#index", :as => "welcome"
  root :to => "welcome#index"

  get "/groups/:group_id/carts/:cart_id/finalize" => "carts#finalize", :as => "finalize_cart"

  get '/return'=>'carts#return'

  get '/notification' => 'orders#notification'

  get 'orders/:id/refund' => 'orders#refund', :as => 'refund'

  post 'groups/:id' => 'groups#add_group_member', :as => 'add_group_member'

  post 'bills/:id/status_paid' => 'bills#status_paid', :as => 'status_paid'
  post 'bills/:id/status_confirmed' => 'bills#status_confirmed', :as => "status_confirmed"

  get '/bills_confirm' => 'bills#confirm', :as => 'bills_confirm'
end
