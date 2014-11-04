Rails.application.routes.draw do
  resources :articles do
    member do
      get :cite
    end
  end
  
  root 'articles#index'

end
