Rails.application.routes.draw do
  resources :articles do
    get :cite, :on => :member
    get :cite_all, :on => :collection
  end
  
  root 'articles#index'

end
