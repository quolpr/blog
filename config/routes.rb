Blog::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  post   'auth', to: 'auth#create'
  delete 'auth', to: 'auth#destroy'
  resources :blog_posts, only:[:index, :create, :update, :destroy, :show]


  root 'home#index'

end
