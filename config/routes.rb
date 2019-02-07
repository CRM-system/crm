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
	end
end
