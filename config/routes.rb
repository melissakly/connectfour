Rails.application.routes.draw do

	get 'auth/:provider/callback', to: 'sessions#create'
    get 'auth/failure', to: redirect('/')
    get 'signout', to: 'sessions#destroy', as: 'signout'
 
    resources :sessions, only: [:create, :destroy]
    resource :home, only: [:show]
 
    root to: "home#index"


 	get 'sessions/create'

  	get 'sessions/destroy'

    get 'game', to: 'game#view'

	get 'user', to: 'user#view', as: :user

    get 'badges', to: 'user#badges'

    get 'profile', to: 'user#profile'

	post 'create_user', to: 'user#create', as: :create_user
	post 'create_game', to: 'game#create', as: :create_game
    post 'play_game', to: 'game#play', as: :play_game
end
