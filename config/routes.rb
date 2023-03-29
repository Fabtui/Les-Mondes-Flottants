Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "pages#loading"
  get '/home', to: "pages#home"
  get 'user_root' => 'pages#home', as: :user_root

  resources :appointments, only: [:show]
  resources :flashes, only: [:index]
  resources :artists, only: [:show]
  post '/artists/:artist_id/appointments', to: 'appointments#create', as: 'user_appointments'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :artists, only: [:show, :index]
    end
  end
end
