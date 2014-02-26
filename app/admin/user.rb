ActiveAdmin.register User do
  
  controller do
    #...
    def permitted_params
      params.permit!
    end
  end
  
 show do |user|
   
   attributes_table do
       row  :id
       row  :email
       row  :time_zone
       row  :created_at
       row  :updated_at
   end 
   
#profiles related list  
   div do      
      panel("Profiles") do
        table_for(user.profiles) do          
          column :id
          column :name do |p|
            link_to p.name, admin_profile_path(p)
          end
          column :profession
          column :created_at
          column :updated_at     
        end
      end
    end    

#requests related list   
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
              link_to i.profile.name, admin_profile_path(i.profile)
            end 
          end
#show link to view the request with comments if the request has any comments         
          column "Comments" do |i|
            if i.comments.present?
              link_to "View Comments", admin_request_path(i)
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