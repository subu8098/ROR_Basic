Rails.application.routes.draw do
  
  get '/not_found', to: 'errors#not_found', as: 'not_found'
  get 'articles/:id/cloud_html', to: 'articles#cloud_html', as: :article_cloud_html

  root "articles#index"
   resources :articles do
    resources :comments, only: [:create, :destroy]
  end
  
end
