Rails.application.routes.draw do
	
  resources :boms
  resources :part_modules
	resources :questionnaires
	resources :parts
	resources :firmwares
	resources :bom_categories
	resources :part_categories

	get 'static_pages/index'

	devise_for :users, :controllers => {:registrations => "registrations"}

	root 'static_pages#index'

	resources :users_admin, :controller => 'users'

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
