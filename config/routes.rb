Rails.application.routes.draw do
 root 'tests#index'
  devise_for :workers
end
