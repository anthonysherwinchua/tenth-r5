Rails.application.routes.draw do

  devise_for :users

  namespace :admin do

    root to: 'dashboard#show'

    namespace :lookups do

      resources :blood_types, only: [:index, :new, :create, :edit, :update]

    end

  end

  root to: "pages#index"

end
