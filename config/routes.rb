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
		root 'orders#index'
		resources :workers
		resources :roles
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
		resources :products
		post '/duplicate/products/:id' => 'products#duplicate', as: 'duplicate'
		resources :orders
		get '/check_params' => 'orders#check_params', as: 'check_params'
		get '/search_by_date' => 'orders#search_by_date', as: 'search_by_date'
    get '/search_by_date_1_day_ago' => 'orders#search_by_date_1_day_ago', as: 'search_by_date_1_day_ago'
    get '/search_by_month' => 'orders#search_by_month', as: 'search_by_month'
    get '/search_by_year' => 'orders#search_by_year', as: 'search_by_year'
	end
end
