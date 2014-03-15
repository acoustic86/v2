Showping::Application.routes.draw do
  
  devise_for :users 
  
  devise_for :admin_users, ActiveAdmin::Devise.config 
    ActiveAdmin.routes(self) do
      resources :requests
    end
  resources :users do
    resources :requests do
      resources :comments
    end
  end
  
  resources :comments
  
  resources :users do
    resources :profiles
  end
  
  match '/users/:user_id/my_profiles', to: 'profiles#my_profiles', via: 'get', as: 'my_profiles' 
  
  resources :profiles do
      resources :requests do 
        get 'new_product', on: :new
        get 'new_service', on: :new 
        get 'new_event', on: :new       
        resources :comments
      end
  end
  
 # resources :requests ... did I need this?
  
  
  namespace :admin do
    resources :profiles do
      resources :requests
    end
  end
  namespace :admin do
    resources :users do
      resources :requests
    end    
  end
  
  namespace :admin do
    resources :requests do
      resources :comments
    end  
  end
   
  resources :requests do
    resources :comments
  end
  
  # get "contact_form/new"
  # post "contact_form/send_email", :as => "send_email"
  match '/contact_form', to: 'contact_form#new', via: 'get'
  match '/send_email', to: 'contact_form#send_email', via: 'post'

  root to: "profiles#index"
  
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
