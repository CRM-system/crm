Rails.application.routes.draw do
	root 'products#index'
	devise_for :workers
	resources :workers
	resources :products do
		resources :orders, only: [:new, :create]
	end

	namespace :admin do
		root 'products#index'
		resources :workers
		resources :roles
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
		resources :products
		post '/duplicate/products/:id' => 'products#duplicate', as: 'duplicate'
		resources :orders
		get '/status' => 'orders#status', as:'status'
		get "/status_new_order", to: "orders#get_orders_by_status_new_order", as: 'new_order_status'
	end
end
