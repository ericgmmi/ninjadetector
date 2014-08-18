Ninjadetector::Application.routes.draw do
#  get "pages/home"
#  get "pages/scan"
##  get "pages/view"
#  get "pages/rogue"
#  get "pages/configure"
  root "pages#home"
#  get "nodes/index"
#  get "devices/index"
#  get "locations/index"
  resources :nodes
  resources :devices
  resources :locations
  match '/scan',      to: 'pages#scan',       via: 'get'
  match '/rogue',      to: 'pages#rogue',      via: 'get'
  match '/configure',  to: 'devices#index',  via: 'get'
  match '/devices/new', to: 'devices#create', via: 'get'
  match '/view',        to: 'nodes#index',    via: 'get'
  match '/approve(/:id)',     to: 'nodes#approve',  via: 'post'
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
