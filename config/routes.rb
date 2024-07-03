Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
  	namespace :v1 do
  		patch 'edit-survey/:id', to: 'surveys#update', as: 'update_survey'
  		resources :surveys, only: [:create, :show, :index] do
  			resources :components, only: [:index, :create, :update, :destroy]
    	end
  	end
  end
end
