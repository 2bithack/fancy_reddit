Rails.application.routes.draw do
  resources :subreddits, only: [:show, :create, :new] do
      resources :posts, only: [:show, :index, :new, :create]
  end

  root to: 'posts#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
