Rails.application.routes.draw do

  resources :launchstarts

  devise_for :admins
  get 'enter_launch_codes', to: 'nuclear_codes#enter_launch_codes', as: :enter_codes
  get '/launched', to: 'nuclear_codes#launched', as: :launched

  post 'verify_launch_codes', to: 'nuclear_codes#verify_launch_codes'

  resources :nuclear_codes
  resources :games
  resources :terror_trackers
  post 'reset_game', to: 'main#reset_game', :as => 'reset_game'
  patch 'alert_update', to: 'main#update_control_message', as: :alert_update
  post 'toggle_game_status', to: 'main#toggle_game_status', as: :toggle_game_status
  get 'status', to: 'main#index'
  get 'admin' =>'main#admin', :as =>'admin_controls'
  root to: "main#index"
  
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
