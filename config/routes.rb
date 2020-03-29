Rails.application.routes.draw do
  
  resources :apidocs, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :comments
      resources :articles      
      resources :users, only: [:index, :create, :show, :update, :destroy]
      resources :sessions, only: [:create]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
