Rails.application.routes.draw do
	devise_for :workers
	root 'workers#index'
	resources :workers

	namespace :admin do
		root 'workers#index'
		resources :workers
		resources :roles
		
	end
end
