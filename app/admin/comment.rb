ActiveAdmin.register Comment do
  
  batch_action :flag do |selection|
      Comment.find(selection).each do |comment|
        comment.flag! :hot
      end
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
