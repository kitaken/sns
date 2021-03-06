#coding:UTF-8
Sns::Application.routes.draw do

  scope "/friend" do
    get "/applicate", :to => "friends#applicate", :via => :post
    get "/accept",    :to => "friends#accept",    :via => :post
    get "/block", :to => "friends#block", :via => :post
    get "/cancel", :to => "friends#cancel", :via => :post
    get "/remove",    :to => "friends#remove",    :via => :post
    get "/:id",       :to => "friends#index",     :via => :get, :as => :friends
  end

  scope '/letterbox' do
    get "/" , :to=>"letterbox#index",:as=>:letterbox
    get "/:id", :to=>"letterbox#conversation",:as=>:conversation
    resources :letters
  end

  resources :events do
    resources :attendances
  end

  resources :profiles

  resources :questions do 
    resources :answers
  end

  root :to=> 'welcome#index'
  match '/preferences', :to=> 'welcome#preferences',:as=>:user_preferences

  resources :articles do
    resources :translations
  end

  devise_for :users do
    get 'tasks', :to=> 'tasks#index', :as => :user_root
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
    #  match ':controller(/:action(/:id(.:format)))'
 
end
