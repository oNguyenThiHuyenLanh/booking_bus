Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"

  namespace :admin do
    root "home#show"
  end
end
