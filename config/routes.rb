Rails.application.routes.draw do
	root 'products#index'
	devise_for :workers
	resources :workers
	resources :products do
		resources :orders, only: [:new, :create]
	end

	namespace :admin do
		root 'orders#status'
		resources :workers
		resources :roles
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
		resources :products
		post '/duplicate/products/:id' => 'products#duplicate', as: 'duplicate'
		resources :orders
		get '/status' => 'orders#status', as:'status'
		# get "/order_by_status", to: "orders#get_orders_by_status_params", as: 'order_by_status'
	end
end
