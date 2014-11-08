Rails.application.routes.draw do
  resources :articles do
    get :cite, :on => :member
    get :cite_all, :on => :collection
  end
  
  match 'design', to: 'articles#design', via: 'get'
  match 'article1', to: 'articles#article1', via: 'get'
  match 'article2', to: 'articles#article2', via: 'get'
  match 'article3', to: 'articles#article3', via: 'get'
  match 'article4', to: 'articles#article4', via: 'get'
  match 'article5', to: 'articles#article5', via: 'get'
  match 'citearticles', to: 'articles#citearticles', via: 'get'

  root 'articles#article1'

end
