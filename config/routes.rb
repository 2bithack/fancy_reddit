Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :subreddits, only: [:show, :create, :new, :index, :destroy] do
      resources :posts, only: [:show, :new, :create, :destroy, :update, :edit]

  end
  resources :post, only: [:index, :edit, :destroy, :update] do
      resources :comments, only: [:create, :destroy, :update, :edit]
  end

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  

  resources :sessions

  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
