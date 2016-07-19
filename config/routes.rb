Rails.application.routes.draw do
  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#new'

  get '/home', to: 'pages#home'
  get '/about', to: 'pages#about'
  get '/new', to: 'pages#new', as: "splash_page"

  get '/admin', to: 'admin#home'
  get 'admin/groups', to: 'admin#groups'
  get 'admin/shows', to: 'admin#shows'
  get 'admin/shows/new', to: 'shows#new', as: 'new_shows'
  post 'admin/shows/new', to: 'shows#create'
  delete 'admin/shows/:id', to: 'shows#destroy'
  get 'admin/shows/:id/key', to: 'shows#key', as: 'keys'
  get 'admin/shows/:id/configure', to: 'shows#configure', as: 'show_weeks'
  post 'admin/shows/:id/configure', to: 'show_weeks#create'

  get '/signup', to: 'users#new', as: "signup"

  get 'contestants/index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'groups/:id/group-rankings', to: 'groups#grouprankings', as: 'group_rankings'
  get 'groups/:id/group-picks', to: 'groups#picks', as: 'group_picks'

  get 'groups/:id/picks/week/:week_number', to: 'picks#new', as: 'new_picks'
  post 'groups/:id/picks/week/:week_number', to: 'picks#create'


  resources :users, :contestants, :groups

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
