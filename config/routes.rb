Rails.application.routes.draw do
  get 'tops/index'
  devise_for :users
  root to: "tops#index"
end
