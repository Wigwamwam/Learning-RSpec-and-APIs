Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :brands, only: [ :index, :show, :update, :create, :destroy ] do
        resources :models, only: [ :index, :show, :update, :create, :destroy ] do
          resources :vehicles, only: [ :index, :show, :update, :create, :destroy ]
        end
      end
    end
  end
end
