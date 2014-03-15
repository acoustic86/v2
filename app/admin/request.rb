ActiveAdmin.register Request do 
  #filter :profile_id
 #filter :user_id
    #belongs_to :profile
    #belongs_to :user
    #navigation_menu :profile
    #belongs_to :profile
    
    controller do
    #...
      #def index
          #@users = User.find(params[:user_id])
          #@profiles = Profile.find(params[:profile_id])
          
     #     if (params.has_key?(:user_id))
     #       @requests = Request.where(user_id: params[:user_id])
     #       #@requests = Request.find_by user_id: (params[:user_id])
     #       
     #     end
     #     
        #if (params.has_key?(:profile_id))
         #  @comments = Comment.where(commentable_id: params[:profile_id])           
       #  end
         
         
                 
     #     @requests = Request.all
         
     # end
     
     #def scoped_collection
     # end_of_association_chain.includes(@profile)
     #end
     
      #def query_parameters
        #@query_parameters ||= self.class.parse_query_parameters(query_string)
      #end
      
              
      def permitted_params
        params.permit!
      end     
    end
    
    #index do    
     #column :id
     #column :profile_id        
     #column :user_id
     #column :date
     #column :time
     #column :description      
     #column :created_at      
     # default_actions      
    #end
    
    form do |f|
      f.inputs "Details" do
        f.input :date
        f.input :time
        f.input :description
      end
      f.inputs "User" do
        f.input :user, :member_label => :email
      end
      f.inputs "Profile" do
        f.input :profile
      end
      f.actions
    end
    
    
   show do |request|
     attributes_table do
       row  "Name" do |i|
         i.profile.present?
         link_to i.profile.name, admin_profile_path(i.profile)        
       end
       row  :date
       row  :time
       row  :description
       row  :created_at
       row  :updated_at
     end 
     # this doesn't work on Heroku     
     #   div do    
     #     panel("Comments") do  
            
     #       @comments = Comment.where(commentable_id: request)
            
     #       table_for(@comments) do 
     #         column :id do |c|                
     #           link_to c.id, admin_comment_path(c) if c.id.present?
     #         end
             # column :title
     #         column :comment
             # column :commentable
             # column :commentable_type
             # column :role
     #         column :created_at
             # column :updated_at
     #       end
     #     end
     #   end    
      #####
      end  
end