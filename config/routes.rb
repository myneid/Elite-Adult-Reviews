EliteAdultReviews::Application.routes.draw do
  match 'search/:query' => 'search#search'
  match 'niche/:niche' => 'niche#niche'
  namespace :admin do
      resources :ratings
      resources :sites
      resources :categories
      resources :users
  end

 
  scope "/admin" do 
    resources :categories
    resources :sites
    resources :ratings
    resources :prices
    resources :sub_ratings
    resources :screenshots
    resources :users
  end

  resources :categories

  match 'admin/' => 'admin/top#index'
  match ':name/' => 'reviews#show'
  match '/' => 'main#index'
  match '/:controller(/:action(/:id))'
end
