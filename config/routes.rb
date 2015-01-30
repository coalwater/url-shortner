Rails.application.routes.draw do
  devise_for :users
  resources :url, path: '', only: %i(show) do
    collection do
      get :urls
    end
  end

  root to: 'dashboard#index'
end
