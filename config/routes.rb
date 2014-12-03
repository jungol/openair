Rails.application.routes.draw do

  root 'articles#design'

  resources :articles do
    resources :citations, only: [:index]
    get :cite, :on => :member
    # get :cite_all, :on => :collection
  end

  resources :citations, only: [:show]
  
  match 'design', to: 'articles#design', via: 'get'


end
