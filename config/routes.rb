Rails.application.routes.draw do
  devise_for :doctors
	resources :patients
	root 'patients#index'
end
