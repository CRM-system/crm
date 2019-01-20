Rails.application.routes.draw do
	root 'products#index'
	devise_for :workers
	resources :workers
	resources :products

	namespace :admin do
		root 'workers#index'
		resources :workers
		resources :roles
		resources :products
		post '/duplicate/products/:id' => 'products#duplicate', as: 'duplicate'
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
	end
end
