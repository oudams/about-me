Rails.application.routes.draw do
  root to: "home#index"

  namespace :dashboard do
    root to: "home#index"
    get "home/index"
  end

  devise_for :users
end
