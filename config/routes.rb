Rails.application.routes.draw do
  
  get '/not_found', to: 'errors#not_found', as: 'not_found'

  root "articles#index"
   resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  
end
