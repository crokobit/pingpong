Pingpong::Application.routes.draw do

  root :to => "home#index"
  resources :pongs do
    resource :account

    member do
      post :toggle
    end
    resources :votes, only: [] do
      collection do
        post :dhh
        post :user
      end
    end
    resources :rates, only: [] do
      collection do
        post :up
        post :down
      end
    end
  end

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', :as => :signin
  get '/signout' => 'sessions#destroy', :as => :signout
  get '/auth/failure' => 'sessions#failure'
end
