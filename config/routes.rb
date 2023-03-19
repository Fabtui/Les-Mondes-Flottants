Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#loading"
  get '/home', to: "pages#home"

  resources :artists, only: [:show]
end
