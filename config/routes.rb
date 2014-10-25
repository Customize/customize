Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#home"

    resources :pages
  end
end
