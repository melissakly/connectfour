Rails.application.routes.draw do
	root to: 'home#index'

	get 'user', to: 'user#view', as: :user

	post 'create_user', to: 'user#create', as: :create_user
	post 'create_game', to: 'game#create', as: :create_game
end
