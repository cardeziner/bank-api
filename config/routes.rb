Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do 
      resources :customers do 
        resources :accounts, only: [:index, :show, :create] do 
          resources :transfers, only: [:index, :create]
          resources :deposits
          resources :withdrawals
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
