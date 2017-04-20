Rails.application.routes.draw do
  devise_for :doctors,:controllers => { registrations: 'registrations' }
	resources :patients do
		resources :reports
	end
	root 'patients#index'


end
