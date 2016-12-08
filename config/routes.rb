Rails.application.routes.draw do
  

  devise_for :users
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
  get 'admin/shows/new', to: 'shows#new', as: 'new_show'
  post 'admin/shows/new', to: 'shows#create'
  delete 'admin/shows/:id', to: 'shows#destroy'
  get 'admin/shows/:id/contestant', to: 'contestants#new', as: 'new_contestant'
  post 'admin/shows/:id/contestant', to: 'contestants#create'
  get 'admin/shows/:id/key', to: 'shows#key', as: 'keys'
  post 'admin/shows/:id/key', to: 'shows#keycreate'
  get 'admin/shows/:id/key/:week/edit', to: 'shows#keyedit', as: 'edit_key'
  patch 'admin/shows/:id/key/:week/', to: 'shows#keyupdate', as: 'update_key'
  put 'admin/shows/:id/key/:week/', to: 'shows#keyupdate'
  get 'admin/shows/:id/configure', to: 'shows#configure', as: 'show_weeks'
  post 'admin/shows/:id/configure', to: 'show_weeks#create'

  get '/signup', to: 'users#new', as: "signup"

  get 'contestants/index'
  get 'contestants/:id', to: 'contestants#show', as: 'contestant'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get 'groups/new/', to: 'groups#new', as: 'new_group'
  get 'groups/:id', to: 'groups#rankings', as: 'group_rankings'
  get 'groups/:id/picks', to: 'groups#picks', as: 'group_picks'
  get 'groups/:id/posts', to: 'groups#posts', as: 'group_posts'
  get 'groups/:id/contestants', to: 'groups#contestants', as: 'group_contestants'
  get 'groups/:id/chat', to: 'groups#chat', as: 'group_chat'

  post 'groups/:id/chat', to: 'chats#create'

  get 'groups/:id/posts/new', to: 'posts#new', as: 'new_post'
  post 'groups/:id/posts/new', to: 'posts#create'

  #get 'groups/:id/posts/:post_id/new', to: 'comments#new', as: 'new_comment'
  post 'groups/:id/posts/:post_id/comments/new', to: 'comments#create'


  get 'groups/:id/picks/week/:week', to: 'picks#new', as: 'new_picks'
  post 'groups/:id/picks/week/:week', to: 'picks#create'


  resources :users, :posts, :comments, :groups, :chats
end
