Rails.application.routes.draw do
  get 'goods/index'
  devise_for :users
  root to: "goods#index"
  resources :goods, only: [:new, :create, :index, :show, :edit, :update, :destroy]
end
