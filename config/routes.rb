Rails.application.routes.draw do
	
	resources :multi_questions
	resources :questions
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

	post 'users_admin/change_role', to: 'users#change_role' 
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
