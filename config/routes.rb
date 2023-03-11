Rails.application.routes.draw do
  resources :books, only: [:show]

  post '/search', to: "books#search"
  get '/convert', to: "books#convert"
  post '/convert_isbn', to: "books#convert_isbn"

  root "books#index"
end
