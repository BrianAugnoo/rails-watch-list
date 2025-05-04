Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "lists#index"
  resources :lists do
    resources :movies, only: [ :index ] do
      resources :bookmarks, only: [ :new, :create ]
    end
  end
  resources :bookmarks, only: [ :destroy ]
end
