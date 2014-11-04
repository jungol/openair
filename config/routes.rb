Rails.application.routes.draw do
  resources :articles do
    member do
      get :cite
    end
    collection do
<<<<<<< HEAD
      get :cite_all
=======
    	get :cite_all
>>>>>>> cite-refactor
    end
  end
  
  root 'articles#index'

end
