Rails.application.routes.draw do

	root 'welcome#welcome'

	devise_for :workers, :skip => [:registrations]
	as :worker do
		get 'workers/edit' => 'devise/registrations#edit', :as => 'edit_worker_registration'
		put 'workers' => 'devise/registrations#update', :as => 'worker_registration'
	end

	resources :workers

	namespace :admin do
<<<<<<< HEAD
		root 'orders#status'
=======

		root 'orders#welcome'
>>>>>>> 1b57f0e61d33dd3a7ba73711113019756f1bb1f8
		resources :workers
		resources :landings
		resources :roles
		resources :functions
		put '/access/functions/:id' => 'functions#access', as: 'access'
		resources :products
		post '/duplicate/products/:id' => 'products#duplicate', as: 'duplicate'
		resources :orders, only: [:show, :index]
		resources :orders do
			resources :comments
			member do
				get :show_pdf
			end
		end
		get '/check_params' => 'orders#check_params', as: 'check_params'

		get '/search_by_date' => 'orders#search_by_date', as: 'search_by_date'
		get '/search_by_date_1_day_ago' => 'orders#search_by_date_1_day_ago', as: 'search_by_date_1_day_ago'
		get '/search_by_month' => 'orders#search_by_month', as: 'search_by_month'
		get '/search_by_year' => 'orders#search_by_year', as: 'search_by_year'

	end

	namespace :api do
    get 'products/index'

    namespace :v1 do
    	get 'orders/thanks'
      post 'orders/create'
      get 'landings/show'
    end
  end
end
