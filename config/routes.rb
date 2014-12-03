Rails.application.routes.draw do
  
  get 'citations/show'

  get 'citations/index'

  root 'articles#design'

  resources :articles do
    get :cite, :on => :member
    get :cite_all, :on => :collection
  end
  
  match 'design', to: 'articles#design', via: 'get'


end
