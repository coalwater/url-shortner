Rails.application.routes.draw do
  devise_for :users
  resources :url, path: '', only: %i(show)
end
