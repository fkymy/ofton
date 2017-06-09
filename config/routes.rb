Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  root 'posts#index'

  resources :posts
end
