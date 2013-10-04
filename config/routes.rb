SiteAboutNMSutton::Application.routes.draw do
  get "work_category_content/choose_work_category"

  get "work_category_content/display_work_category"

  get "tag_details/tag_details"

  get "work_experience_extractor/ExtractExperienceSections"

  get "tag_navigator/tag_navigator"

  get "nmsuttondetails/index"

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
  root :to => 'nmsuttondetails#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  match '/tag_navigator/tag_details' => 'tag_details#tag_details'
  
  match '/work_experience_extractor/process_work_experience_document' => 'work_experience_extractor#processWorkExperienceDocument'
  
  match '/work_experience_extractor/process_tag_categories_document' => 'work_experience_extractor#processTagCategoriesDocument'
  
  match '/work_category_content/projects' => 'work_category_content#projects'
  
  match '/work_category_content/jobs' => 'work_category_content#jobs'
  
  match '/work_category_content/classes' => 'work_category_content#classes'
end
