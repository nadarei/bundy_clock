BundyClock::Application.routes.draw do
  post "time_logs/time_in", as: :time_in

  put "time_logs/update", as: :update

  put "time_logs/time_out", as: :time_out

  get "/login" => "sessions#new", as: :login

  get "/logout" => "sessions#destroy", as: :logout

  match "/auth/:provider/callback" => "sessions#create"

  match "/auth/failure" => "sessions#failure"

  get "/month" => "time_logs#month"

  get "/month/:date" => "time_logs#month", as: :month

  get "/archive" => "time_logs#archive", as: :archive

  resources :leaves, except: [:edit, :update]

  get "/leaves/:date/edit" => "leaves#edit", as: :edit_leave
  put "/leaves/:date" => "leaves#update", as: :update_leave

  resources :users

  # /time_log (JS)
  resources :time_logs

  # /me (Account settings)
  get "/me" => "users#settings", as: :settings

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
