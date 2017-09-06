Rails.application.routes.draw do
  # devise_for :users, path: 'users', controllers: { }
  devise_for :users, controllers: { views: "users/", registrations: "users/registrations"}

  resources :inventories
  
  get 'pages/index'
  get 'pages/my_accounts'
  get 'admin_panel/today'
  resources :accounts 
  resources :payments
  devise_for :airports
  resources :automated_transactions
  resources :invoices
  resources :line_items
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  # resources :quickbooks_authorizations
    match 'quickbooks_authorizations/create' => 'quickbooks_authorizations#create', via: :get
    match 'quickbooks_authorizations/new' => 'quickbooks_authorizations#new', via: :get
    match 'quickbooks_authorizations/create_quickbooks_accounts' => 'quickbooks_authorizations#create_quickbooks_accounts', via: :get
    match 'quickbooks_authorizations/select_accounts' => 'quickbooks_authorizations#select_accounts', via: :get
  # match 'auth/:provider/callback' => 'quickbooks_authorizations#new', via: :all
  # match 'auth/failure' => 'quickbooks_authorizations#failure', via: :all
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
