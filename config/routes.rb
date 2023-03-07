Rails.application.routes.draw do
  resources :homepages, only: [:index]

  root "homepages#index"
end
