Rails.application.routes.draw do
  root 'posts#index'
  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:show, :new, :create]
    resources :categories, only: [:index, :new, :create]
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
