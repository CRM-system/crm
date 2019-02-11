Rails.application.routes.draw do
	root 'products#index'
	devise_for :workers, :skip => [:registrations]
	as :worker do
		get 'workers/edit' => 'devise/registrations#edit', :as => 'edit_worker_registration'
		put 'workers' => 'devise/registrations#update', :as => 'worker_registration'
	end
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
		get '/check_params' => 'orders#check_params', as: 'check_params'
		# get '/status' => 'orders#status', as:'status'
		# post '/change_status/orders/:id/:status' => 'orders#change_status', as: 'change_status'
		# get "/order_by_status", to: "orders#get_orders_by_status_params", as: 'order_by_status'
		# post "/change_status_from_new_to_refused/:id" => "orders#change_status_from_new_to_refused", as: 'from_new_to_refused'

	end
end
