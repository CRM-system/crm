Rails.application.routes.draw do
  get 'orders/new'
	root 'products#index'
	devise_for :workers
	resources :workers
	resources :products
	post 'send_to_order/products/:id' => 'products#send_to_order', as: 'send_to_order'

	namespace :admin do
		root 'products#index'
		resources :workers
		resources :roles
		resources :products
		resources :orders
		post '/duplicate/products/:id' => 'products#duplicate', as: 'duplicate'
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
	end
end
