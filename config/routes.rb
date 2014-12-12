Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'static_pages#home'

  resources :articles do
    get :cite, :on => :member, to: 'citations#show', via: 'get'
  end
   
  resources :citations, only: [:index]

end
