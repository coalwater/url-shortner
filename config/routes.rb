Rails.application.routes.draw do
  resources :url, path: '', only: %i(show)
end
