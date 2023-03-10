Rails.application.routes.draw do
  resources :books, only: [:show]
  resources :homepages, only: [:index]

  root "homepages#index"
end
