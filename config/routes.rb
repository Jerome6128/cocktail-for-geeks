Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root to: ''
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: :create
    resources :reviews, only: :create
  end
  resources :doses, only: [:new, :destroy]
  resources :reviews, only: :new
end
