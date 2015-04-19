RaushWeb::Application.routes.draw do
  resources :pages

scope "(:locale)", :locale => /en|fa/ do
   resources :skills

  resources :factor_details

  resources :contacts do
    member do
      get :search  
    end
    collection do      
      get :company_names      
    end
  end

  resources :payment_groups

  resources :account_documents do    
    collection do
      get :profit
      get :profit_month   
      get :autocomplete_contact_company_name
    end
    member do
      get :confirm
    end
  end

  resources :related_people

  resources :camera_models

  resources :subservices

  resources :users
  resources :order_onlines

  resources :pictures

  resources :portfolios do
    collection do
      get :web_protfolio
    end
  end
  resources :services

  resources :design_samples

  resources :tariff_prices

  resources :tariff_orders
  resources :teams do
    collection do
    get :team_work
    end
  end
end
  #get "raush" => "static#home"
  root :to => 'static#home'
  get 'google46bde3a8d7d48d7d'  => 'static#google46bde3a8d7d48d7d'
  get 'site-seo-analysis.com'  => 'static#site-seo-analysis.com'
  get 'accounting'  => 'static#accounting'
  get "login" => "users#login"  
  get 'search_phone' => 'contacts#search'
  get "sitemap.xml" => "static#sitemap", :format => "xml", :as => :sitemap
  post "create_session" => "users#create_session", :as => :create_session
  get "delete_session" => "users#delete_session", :as => :delete_session
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
