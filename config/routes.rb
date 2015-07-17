Rails.application.routes.draw do

  root :to => "users#new"
  resources :posts, only: [:index]

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
  resources :users, only: [:new, :create]
  resource :session, only: [:create, :destroy, :new]
  resources :subs
end
#   users GET    /users(.:format)          users#index
#          POST   /users(.:format)          users#create
# new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#     user GET    /users/:id(.:format)      users#show
#          PATCH  /users/:id(.:format)      users#update
#          PUT    /users/:id(.:format)      users#update
#          DELETE /users/:id(.:format)      users#destroy
#
