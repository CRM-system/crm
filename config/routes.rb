Rails.application.routes.draw do
	root 'workers#index'
	resources :workers
	devise_for :workers
end
