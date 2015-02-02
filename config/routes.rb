Rails.application.routes.draw do
  devise_for :users
  resource :dashboard, only: :show do
    collection do
      get :homepage
      get :urls
      get :hits
    end
  end

  get '/:id', to: 'urls#redirect'

  root to: 'dashboards#homepage'
end
