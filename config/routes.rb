require 'sidekiq/web'
BubboliKids::Application.routes.draw do

  #root :to => 'gifts#index'
  root :to => 'pages#home'
  mount Sidekiq::Web, at: '/sidekiq'
  
  match '/home2', :to => 'pages#home2', :as => :home2
  
  
  match '/gifts/list', :to => 'gifts#list', :as => :list_gift
  match '/gifts/manage', :to => 'gifts#manage', :as => :manage_gift
  match '/gift/favorite', :to => 'gifts#favorite', :as => :favorite_gift
  match '/gift/brands', :to => 'pages#brands', :as => :gift_brand
  match 'gift/recently_added', :to => 'gifts#recently_added', :as => :recently_added_gift
  match 'gift/baby_shower', :to => 'gifts#baby_shower', :as => :baby_shower_gift

  match '/gift_categories/list', :to => 'gift_categories#list', :as => :list_gift_category
  match '/gift_categories/manage', :to => 'gift_categories#manage', :as => :manage_gift_category

  match '/gift_age_ranges/list', :to => 'gift_age_ranges#list', :as => :list_gift_age_range
  match '/gift_age_ranges/manage', :to => 'gift_age_ranges#manage', :as => :manage_gift_age_range

  match '/gift_price_ranges/list', :to => 'gift_price_ranges#list', :as => :list_gift_price_range
  match '/gift_price_ranges/manage', :to => 'gift_price_ranges#manage', :as => :manage_gift_price_range

  match '/about', :to => 'pages#about', :as => :about
  match '/terms', :to => 'pages#terms', :as => :term
  match '/privacy', :to => 'pages#privacy', :as => :privacy
  match '/signout', :to => 'sessions#destroy', :as => :sign_out
  match '/signin', :to => 'sessions#new', :as => :sign_in

  match '/blog/list', :to => 'blogs#list', :as => :list_blog
  match '/blog/manage', :to => 'blogs#manage', :as => :manage_blog
  match '/blog_categories/list', :to => 'blog_categories#list', :as => :list_blog_category
  match '/blog_categories/manage', :to => 'blog_categories#manage', :as => :manage_blog_category
  match '/blog/archive/:year/:month', :to => 'blogs#archive', :as => :archive_blog
  get '/blog(.:format)', :to => 'blogs#index', :as => :blogs
  post '/blog(.:format)', :to => 'blogs#create', :as => :blogs
  
  match '/comments/list', :to => 'comments#list', :as => :list_comment
  
  match '/admin', :to => 'admins#index', :as => :admin

  match '/users/:id/search_child', :to => 'children#search_child', :as => :search_child
  match '/users/:id/following', :to => 'users#following', :as => :following
  match '/users/:id/pending', :to => 'users#pending', :as => :pending
  match '/users/:id/followers', :to => 'users#followers', :as => :followers
  match '/users/:id/requests', :to => 'users#requests', :as => :requests
  match '/users/thankyou(/:id)', :to => 'users#thankyou', :as => :thankyou
  match '/users/confirm/:confirmation_token', :to => 'users#confirm', :as => :confirm
  match '/signup/:invitation_token', :to => 'users#new'
  
  match '/relation_types/manage', :to => 'relation_types#manage', :as => :manage_relation_types
  match '/relation_types/list', :to => 'relation_types#list', :as => :list_relation_types
  match '/child_images/:id/set_as_profile_picture', :to => 'child_images#set_as_profile_picture', :as => :set_as_profile_picture

  match '/index', :to => 'pages#index', :as => :test_index_path
  match '/invitations/:id/confirm_or_delete', :to => 'invitations#confirm_or_delete', :as => :invitation_confirm_or_delete
  
  resources :blog, :controller => 'blogs'
  resources :gifts, :my_children, :relation_types, :relationships, :my_kids_relationships
  resources :gift_categories, :users, :blog_categories, :comments, :gift_age_ranges, :gift_price_ranges, :user_child_cat_prefs, :user_child_price_prefs
  resources :sessions, :only => [:create]
  resources :invitations, :only => [:destroy, :show]
  resources :children do
    resources :child_images
    resources :gift_accessions
  end







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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
