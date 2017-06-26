Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, except: [:edit, :update, :delete] do
    resources :comments, only: [:create]
  end
end
