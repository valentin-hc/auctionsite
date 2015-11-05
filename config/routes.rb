Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :destroy, :new] do
    resources :products, only: [:index, :show, :create, :new]
  end
  resources :products, only: [:destroy]
end
