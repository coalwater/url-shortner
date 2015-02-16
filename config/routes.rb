Rails.application.routes.draw do

  devise_for :users

  resource :dashboard, only: :show do
    collection do
      get :urls
      get :hits
    end
  end

  get '/:id', to: 'urls#redirect'

  root to: 'dashboards#show'
end
