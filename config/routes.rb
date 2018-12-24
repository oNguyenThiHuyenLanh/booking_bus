Rails.application.routes.draw do
  root to: "addresses#index"

  namespace :admin do
    root "schedules#index"
    get "/bus/new"
    resources :schedules, only: [:index, :show, :new, :create]
    resources :model_buses, only: [:index, :show, :new, :create]
    resources :buses, only: [:index, :new, :create]
    resources :statistics, only: [:index, :show]
    resources :bills
  end
  devise_for :users

  resources :schedules, only: :index
  get "confirm" => "booking#new"
  post "booking" => "booking#create"
  resources :users, only: :show
end
