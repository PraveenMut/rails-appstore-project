Rails.application.routes.draw do
  get 'stores/new'
  get 'orders/new'
  get 'orders/show'
  get 'order/new'
  get 'order/show'
  get 'apps/index'
  get 'apps/new'
  get 'apps/show'
  get 'apps/edit'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
