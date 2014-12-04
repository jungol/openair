Rails.application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users, only: [:show]
  root 'users#show'

  resources :articles do
    resources :citations, only: [:index]
    get :cite, :on => :member, to: 'citations#show', via: 'get'
  end


  resources :citations, only: [:show]
  
  match 'design', to: 'articles#design', via: 'get'


end
