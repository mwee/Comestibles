ExampleStore::Application.routes.draw do
  
  resources :carts do
  	resources :categories, only: [:show, :index]
  end

  resources :line_items

  resources :categories

  resources :orders

  resources :products

  match "carts/:id/finalize" => "carts#finalize", :as => "finalize_cart"

  match '/return'=>'carts#return'

  match '/notification' => 'orders#notification'

  match 'orders/:id/refund' => 'orders#refund', :as => 'refund'

  # root :to => 'categories#show', :id => 1
  root :to => 'carts#index'

end
