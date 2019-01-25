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
		resources :products
		resources :orders
		post '/duplicate/products/:id' => 'products#duplicate', as: 'duplicate'
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
	end
end
