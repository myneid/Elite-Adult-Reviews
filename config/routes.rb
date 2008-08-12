ActionController::Routing::Routes.draw do |map|

  map.connect 'admin/users/foobar', :controller => 'admin/users', :action => 'foobar'
  map.connect 'search/:query', :controller => 'search', :action => 'search'
  map.connect 'niche/:niche', :controller => 'niche', :action => 'niche'
  map.namespace :admin do |admin|
   admin.resources :ratings
   admin.resources :sites
   admin.resources :categories
   admin.resources :users
  end
  map.resources :categories, :path_prefix => '/admin'
  map.resources :sites, :path_prefix => '/admin'
  map.resources :ratings, :path_prefix => '/admin'
  map.resources :prices, :path_prefix => '/admin'
  map.resources :sub_ratings, :path_prefix => '/admin'
  map.resources :screenshots, :path_prefix => '/admin'
  map.resources :users, :path_prefix => '/admin'
  map.connect 'admin/', :controller => 'admin/top'

  map.connect ':name/', :controller => 'reviews', :action => 'show'

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "main"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
