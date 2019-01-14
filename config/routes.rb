Rails.application.routes.draw do
	devise_for :workers
	root 'products#index'
	resources :workers
	resources :products
end
