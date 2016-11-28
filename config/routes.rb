Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :subreddits, only: [:show, :create, :new] do
      resources :posts, only: [:show, :new, :create]

  end
  resources :post, only: [:index] do
      resources :comments, only: [:create]
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions

  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
