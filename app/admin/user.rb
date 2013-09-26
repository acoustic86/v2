ActiveAdmin.register User do
  
  controller do
    #...
    def permitted_params
      params.permit!
    end
  end
  
 show do |user|
   
   div do     
     user.id     
   end
   
   div do     
     user.email    
   end 
   
   
    div do      
      panel("Requests") do
        table_for(user.requests) do
          column :id do |r|
            link_to r.id, admin_request_path(r)
          end
          column :date
          column :time
          column :description
          column "Name" do |i|
            if i.profile.present?
              i.profile.name
            end 
          end         
        end
      end
    end 
  end
 index do
    column "Users" do |user|
      link_to("View Requests", admin_user_requests_path(user))
    end    
    column :id, :sortable => :id do |user|
      link_to user.id, admin_user_path(user)
    end    
    column :email    
    default_actions    
 end
 
 ActiveAdmin.register Request do
    belongs_to :user, :optional => true    
 end
 
end