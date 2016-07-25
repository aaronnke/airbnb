Rails.application.routes.draw do

  # --------------------------------------- Users ---------------------------------------
  get "/listings/search" => "listings#search", as: "listing_search"
  get "/listings/filter_search" => "listings#filter_search", as: "filter_search"
  # get "/listings/search" => "listings#show_search" as: "listing_results"
  get "/listings/live_search" => "listings#live_search", as: "live_search"
  resources :users, only: [:show, :edit, :update, :destroy, :create]


  concern :paginatable do
  get '(page/:page)', :action => :index, :on => :collection, :as => ''
end

resources :listings, :concerns => :paginatable


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    get "/reservations" => "reservations#index", as: "reservation_index"
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
    resources :listings, only: :index
  end

  resources :listings, except: [:new, :index] do
    resources :reservations, except: [:create]
    post "/reservations" => "reservations#create", as: "reservation_create"
  end



  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  root 'users#home'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"


  # --------------------------------------- Listings ---------------------------------------

  get "/become_a_host" => "listings#new"
  # post "/start_hosting" => "listings#create", as: "listing_create"
  # get "/:id/listings" => "listings#index", as: "listing_index"
  # get "/listings/:id" => "listings#show", as: "listing_show"







# --------------------------------------- Crap ---------------------------------------
  # delete "/sign_out" => "sessions#destroy"

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
