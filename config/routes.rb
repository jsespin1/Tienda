Rails.application.routes.draw do

  get 'sessions/login', :as => :sessions_login

  get 'application/home', :as => :home

  get 'sessions/home'

  get 'sessions/profile', :as => :session_profile

  get 'sessions/setting'

  post 'sessions/login_attempt', to: 'sessions#login_attempt'

  get 'sessions/logout', to: 'sessions#logout', :as => :session_logout

  root 'application#home'

  get 'users/new', :as => :new_user

  post 'users/create', to: 'users#create'

  get 'users/edit', to: 'users#edit', :as => :edit_user

  post 'users/update', to: 'users#update'

  get 'users/cambiar_contrasena', to: 'users#cambiar_contrasena', :as => :cambiarcontrasena_user

  post 'users/update_contrasena', to: 'users#update_contrasena'

  get 'admin/login', :as => :admin_login

  get 'admin/profile', :as => :admin_profile
  
  post 'admin/login_attempt', to: 'admin#login_attempt'

  get 'admin/listar_usuarios'

  get 'admin/new_user', :as => :new_user_admin

  post 'admin/create', to: 'admin#create'

  get 'admin/edit'

  post 'admin/update', to:'admin#update'

  get 'admin/profile/lista_usuarios', to: 'admin#lista_usuarios'

  get 'admin/profile/new_user', to: 'admin#new_user'

  get 'admin/profile/edit_user', to: 'admin#edit_user'



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
