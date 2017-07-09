Rails.application.routes.draw do
  root 'posts#index'

  # static pages
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'privacy_policy' => 'static_pages#privacy_policy'
  get 'rule' => 'static_pages#rule'
  get 'tos' => 'static_pages#tos'

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  resources :posts, except: [:edit, :update, :delete], concerns: :paginatable do
    resources :comments, only: [:create]
  end
end
