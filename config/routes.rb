Rails.application.routes.draw do
  # resources :portfolio, only: [:index] do
  #   collection do
  #     get :show
  #   end
  # end
  get "portfolio/index"
  get "portfolio/show"

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "portfolio#index"
end
