Rails.application.routes.draw do

  # root to: 'api/v1/articles#index'

  namespace :api do
    namespace :v1 do
     resources :articles
    end
  end

  get '/*path', to: 'api/v1/articles#index', format: false

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
