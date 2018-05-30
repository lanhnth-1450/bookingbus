Rails.application.routes.draw do
  root to: "addresses#index"
  get "/pages/:page" => "pages#show"

  namespace :admin do
    root "home#show"
    get "/bus/new"
    resources :schedules, only: [:index, :show, :new, :create]
  end
  devise_for :users

  resources :schedules, only: :index
  get "confirm" => "booking#new"
  post "booking" => "booking#create"
end
