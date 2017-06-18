Rails.application.routes.draw do
  resources :account_term_msts
  root 'home#index'
  
  get 'portal/index'


  get 'home/categories' => "home#log_all_category"
  get 'home/genres' => "home#log_all_genre"

  resources :pay_items

  get 'top' => 'application#top'
  get 'callback' => 'application#callback'
  get 'login' => 'application#login'
  get 'logout' => 'application#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
