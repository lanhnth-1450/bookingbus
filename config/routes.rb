Rails.application.routes.draw do
  get "/pages/:page" => "pages#show"

  namespace :admin do
  	root "static_pages#index"
  	get "/bus", to: "bus#index"
  end
end
