ActiveAdmin.register Comment, as: 'AdminComment' do
  
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
