Rails.application.routes.draw do
  get 'goods/index'
  devise_for :users
  root to: "goods#index"
  resources :goods do
    resources :orders, only: [:index, :create]
  end
end
