Rails.application.routes.draw do

  devise_for :users

  namespace :admin do

    root to: 'dashboard#show'

  end

  root to: "pages#index"
end
