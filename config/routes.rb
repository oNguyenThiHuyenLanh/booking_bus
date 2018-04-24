Rails.application.routes.draw do
  root to: "addresses#index"
  get "/pages/:page" => "pages#show"

  namespace :admin do
    root "home#show"
    resources :schedules, only: [:index]
  end
  devise_for :users
end
