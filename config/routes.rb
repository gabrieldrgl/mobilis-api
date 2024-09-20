Rails.application.routes.draw do
  devise_for :users

  resources :companies do
    member do
      get :students
      get :drivers
      get :moderators
    end

    resources :vans, only: %i[index create update show destroy] do
      member do
        get :current_location
      end

      resources :routes, only: %i[create update]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
