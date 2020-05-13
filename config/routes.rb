Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get 'likes'
      get 'reviews'
    end
  end    
  
  resources :shops do 
    collection do
      get 'search'
    end
  end
  
  resources :reviews, only: [:new, :create, :destroy]
  
  namespace :admin do
    resources :users do
      collection do
        get 'search_shop'
      end
    end
  end
  
  resources :favorites, only: [:create, :destroy]
end
