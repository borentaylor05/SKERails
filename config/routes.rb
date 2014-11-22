Rails.application.routes.draw do

  match 'click', to: "megamenu#click", via: [:get, :post]

  match 'tabs', to: "tab#create", via: :post

  match 'docs', to: "doc#create", via: :post

  match 'searches', to: "search#create", via: :post

  match 'calls', to: "call#create", via: :post

  match 'end-call', to: "call#end_call", via: :post

  # DATA ROUTES

  match 'clicks-per-call', to: "data#clicks_per_call", via: :get

  # APP ROUTES

  match 'apps/wwc/get-structure', to: "content#get_structure", via: :get

  match 'apps/wwc/doc-dropdown', to: "content#get_doc_dropdown", via: :get

  match 'apps/wwc/content/new', to: "content#new_content", via: :post

  match 'apps/wwc/contents', to: "content#get_wwc_content", via: :get

  match 'apps/wwc/new-user', to: "content#new_user", via: :post

#  match 'contents/:id', to: "content#show", via: :get

  match 'contents/docs', to: "content#show", via: :get

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
