Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'static_pages#home'

  resources :articles do
    resources :citations, only: [:index]
    get :cite, :on => :member, to: 'citations#show', via: 'get'
  end


  resources :citations, only: [:show]
  
  match 'design', to: 'articles#design', via: 'get'


end
