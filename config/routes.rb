Rails.application.routes.draw do
  devise_for :users

  resources :companies do
    member do
      get "students"
      get "drivers"
      get "moderators"
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
