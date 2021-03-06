Rails.application.routes.draw do

  resources :pages, only: [:show]
  resources :posts, only: [:show]

  namespace :admin do
    root "static_pages#home"
    resources :pages
    resources :posts
    resources :themes, only: [:index, :new, :create]
  end
end
