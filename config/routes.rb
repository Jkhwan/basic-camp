BasicCamp::Application.routes.draw do

  get "projects/index"
  get "users/index"
  root to: 'welcome#index'
  resources :projects do
    resources :todos
    resources :discussions
    resources :assets
  end
  resources :discussions, only: [:index] do
    resources :messages
  end

  namespace :admin do
    resources :users, only: [:index]
    resources :projects, only: [:index]
  end

  resources :invitations, only: [:new, :create, :show] do
    resources :participants, only: [:new, :create]
  end

  resource :profile, only: [:edit, :update]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:index, :create, :destroy], path: :login
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
