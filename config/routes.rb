Rails.application.routes.draw do
  root 'home#index'
  get "home/index"

  resources :pay_items

  get 'top' => 'application#top'
  get 'callback' => 'application#callback'
  get 'login' => 'application#login'
  get 'logout' => 'application#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
