ActiveAdmin.register Comment do
  
  batch_action :destroy, :if => proc { can?( :destroy, Comment ) } do |selection|
      redirect_to collection_path, :alert => "Didn't really delete these!"
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
