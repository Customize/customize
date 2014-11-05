Rails.application.routes.draw do

  resources :pages
  resources :posts

  namespace :admin do
    root "static_pages#home"
    resources :pages
    resources :posts
  end
end
