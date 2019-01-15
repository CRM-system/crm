Rails.application.routes.draw do
	devise_for :workers
	root 'workers#index'
	resources :workers
	resources :products

	namespace :admin do
		root 'workers#index'
		resources :workers
		resources :products
	end
end
