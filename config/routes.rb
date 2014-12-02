Rails.application.routes.draw do
  
  root 'articles#design'

  resources :articles do
    get :cite, :on => :member
    get :cite_all, :on => :collection
  end
  
  match 'design', to: 'articles#design', via: 'get'


end
