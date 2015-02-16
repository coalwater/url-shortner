Rails.application.routes.draw do

  devise_for :users

  resources :urls
  resources :url_hits, only: %i(show index destroy)

  resource :dashboard, only: :show do
    collection do
      get :urls
      get :hits
    end
  end

  get '/:id', to: 'urls#redirect'

  root to: 'dashboards#show'
end
