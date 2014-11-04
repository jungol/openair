Rails.application.routes.draw do
  resources :articles do
    member do
      get :cite
    end
    collection do
    	get :cite_all
    end
  end
  
  root 'articles#index'

end
