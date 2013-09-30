ActiveAdmin.register Profile do
  
  controller do
    #...
    def permitted_params
      params.permit!
    end
  end
  
  index do
    column "Requests" do |profile|
      link_to("View Requests", admin_profile_requests_path(profile))
    end    
    column :id
    column :name, :sortable => :name do |profile|
      link_to profile.name, admin_profile_path(profile)
    end
    column :experience
    column :profession
    column :current_location
    column :base_price, :sortable => :base_price do |profile|
      div :class => "price" do
        number_to_currency profile.base_price
      end      
    end    
    column :created_at
    column :name 
    default_actions   
  end
  
  ActiveAdmin.register Request do 
    belongs_to :profile, :optional => true
  end
  
end

