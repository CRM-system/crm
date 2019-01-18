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
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
	end
end
