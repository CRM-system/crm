Rails.application.routes.draw do
	devise_for :workers
	root 'products#index'
	resources :workers
	resources :products

	namespace :admin do
		root 'workers#index'
		resources :workers
		resources :roles
		resources :products
	end
end
