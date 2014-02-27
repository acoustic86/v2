ActiveAdmin.register Comment do
  
  batch_action :destroy do |selection|
     Comment.find(selection).each { |p| p.destroy! }
      redirect_to collection_path, :alert => "Didn't delete these!", notice => "Comments Deleted"
    end
  
  controller do
    #...
    def permitted_params
      params.permit!
    end
  end
  
  index do
    selectable_column
    column :user
    column :title
    column :comment
    column :commentable
    column :commentable_type
    column :role
    column :created_at
    column :updated_at
    default_actions
  end

end
