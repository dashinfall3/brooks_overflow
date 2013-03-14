BrooksOverflow::Application.routes.draw do

  resources :users
  resources :questions do
    member do
      post 'comments'
      post 'votes'
    end
  end
  resources :answers do
    member do
      post 'comments'
      post 'votes'
      post 'declare_winner'
    end
  end
  resources :comments
  resources :votes

  resources :sessions, :only => [:new, :create]

  delete 'signout', to: 'sessions#destroy'

  root :to => 'pages#home' 
  
end
