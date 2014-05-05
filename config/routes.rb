Pingpong::Application.routes.draw do

  root :to => "home#index"
  resources :pongs do
    resource :account

    member do
      post :toggle
    end
    resources :votes, only: []
    resources :rates, only: []
  end

  resources :users, only: [:edit, :update]

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
