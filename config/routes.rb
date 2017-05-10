Rails.application.routes.draw do

  devise_for :users

  namespace :admin do

    root to: 'dashboard#show'

    resource :lookups, only: [:show]

    namespace :lookups do

      resources :blood_types, only: [:index, :new, :create, :edit, :update]
      resources :citizenships, only: [:index, :new, :create, :edit, :update]
      resources :civil_statuses, only: [:index, :new, :create, :edit, :update]
      resources :contact_types, only: [:index, :new, :create, :edit, :update]
      resources :countries, only: [:index, :new, :create, :edit, :update]
      resources :documents, only: [:index, :new, :create, :edit, :update]
      resources :languages, only: [:index, :new, :create, :edit, :update]
      resources :occupations, only: [:index, :new, :create, :edit, :update]
      resources :relationships, only: [:index, :new, :create, :edit, :update]
      resources :religions, only: [:index, :new, :create, :edit, :update]
      resources :schools, only: [:index, :new, :create, :edit, :update]
      resources :skills, only: [:index, :new, :create, :edit, :update]
      resources :skin_types, only: [:index, :new, :create, :edit, :update]
      resources :zodiacs, only: [:index, :new, :create, :edit, :update]

    end

    resources :users, only: [:index, :new, :create, :edit, :update] do
      # match :activate, via: [:get, :patch], on: :member
      # match :deactivate, via: [:get, :patch], on: :member
      # match :role, via: [:get, :patch], on: :member
    end

  end

  root to: "pages#index"

end
