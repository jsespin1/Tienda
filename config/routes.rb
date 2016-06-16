Rails.application.routes.draw do

  scope "(:locale)", locale: /es|en/ do

      root 'application#home'

      get 'sessions/login', :as => :sessions_login

      get 'application/home', :as => :home

      get 'sessions/home'

      get 'sessions/profile', :as => :session_profile

      get 'sessions/setting'

      post 'sessions/login_attempt', to: 'sessions#login_attempt'

      get 'sessions/logout', to: 'sessions#logout', :as => :session_logout

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

      get 'admin/cambiar_contrasena', to: 'admin#cambiar_contrasena', :as => :cambiarcontrasena_admin

      post 'admin/update_contrasena', to: 'admin#update_contrasena'

      #--------------------------------Catalogo-Admin---------------------------------#

      get 'admin/editar_catalogo', to: 'admin#editar_catalogo', :as => :editar_catalogo

      post 'admin/editar_producto', to: 'admin#editar_producto', :as => :editar_producto

      post 'admin/actualizar_producto', to: 'admin#actualizar_producto'

      delete 'admin/eliminar_producto', to: 'admin#eliminar_producto'

      post 'admin/agregar_producto', to: 'admin#agregar_producto'

      post 'admin/agregar', to: 'admin#agregar'

      get 'admin/editar_promociones', to: 'admin#editar_promociones', :as => :editar_promociones

      delete 'admin/eliminar_promocion', to: 'admin#eliminar_promocion'

      post 'admin/editar_promocion', to: 'admin#editar_promocion', :as => :editar_promocion

      post 'admin/actualizar_promocion', to: 'admin#actualizar_promocion'

      post 'admin/agregar_promocion', to: 'admin#agregar_promocion'

      post 'admin/agregar_promo', to: 'admin#agregar_promo'

      post 'admin/agregar_producto_promocion', to: 'admin#agregar_producto_promocion'

      post 'admin/subir_producto_promocion', to: 'admin#subir_producto_promocion'

      post 'admin/eliminar_producto_promocion', to: 'admin#eliminar_producto_promocion'

      post 'admin/quitar_producto_promocion', to: 'admin#quitar_producto_promocion'

      #----------------------------------Catalogo-------------------------------------#

      get 'catalogo/index', :as => :catalogo_index
      get 'catalogo/autos', :as => :catalogo_autos
      get 'catalogo/perros', :as => :catalogo_perros
      get 'catalogo/promociones', :as => :catalogo_promociones
      get 'catalogo/show', :as => :catalogo_show_item
      get 'catalogo/getInfo', to: 'catalogo#getInfo', :as => :product_getInfo
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
        get '/products' => 'api#products'
        put '/update/:id' => 'api#update'
        delete '/products/:id' => 'api#delete'
    end
  end

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
