Rails.application.routes.draw do

  # Root
  if Rails.env.development?
    root 'main#amalgam'
  else
    root 'main#home'
  end

  # Main
  get 'home' => "main#home"

  # Games Nested Brackets
  resources :games do   
    resources :brackets do
      resources :maps do
        resources :gametypes
      end
    end
  end
  resources :brackets, only: :index
  
  # Tournaments
  resources :tournaments

  # Examples
  resources :examples

  # Devise
  devise_for :users
  devise_scope :user do
    get '/signout', to: 'devise/sessions#destroy', as: :signout
  end

  # Users
  resources :users

  # Admin
  get 'admin/main' => 'admin_panels#main'
  get 'control' => 'admin_panels#control_panel'

  # Miscellaneous
  get 'new-form' => 'examples#new_form'

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
