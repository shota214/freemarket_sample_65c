Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    # post    "sign_in",              to: "devise/sessions#new"
    # delete  "sign_out",             to: "devise/sessions#destroy"
    get     "index",                to: "users/registrations#index"
    get     "profile",              to: "users/registrations#profile"
    get     "phone",                to: "users/registrations#phone"
    get     "phone_authentication", to: "users/registrations#phone_authen"
    get     "address",              to: "users/registrations#address"
    get     "card",                 to: "users/registrations#card"
    get     "complete",             to: "users/registrations#complete"
    post    "complete",             to: "users/registrations#create"
  end

  root  "items#index"
  resources :items do
  collection do
    get     "confirmation"
  end
end
end