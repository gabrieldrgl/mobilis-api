Rails.application.routes.draw do
  devise_for :users

  resources :users

  resources :companies do
    member do
      get :students
      get :drivers
      get :moderators
      delete 'users/:user_id', to: 'companies#remove_user', as: :remove_user
    end

    resources :vans, only: %i[index create update show destroy] do
      member do
        get :current_location
      end

      resources :routes, only: %i[create update]
    end
  end

  resources :invites, only: [:create] do
    collection do
      post :accept
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
