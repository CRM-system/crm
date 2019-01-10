Rails.application.routes.draw do
	devise_for :workers
	root 'workers#index'
	resources :workers
end
