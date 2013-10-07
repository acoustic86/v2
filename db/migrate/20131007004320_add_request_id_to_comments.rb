class AddRequestIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :request_id, :integer
    
    add_index :comments, :request_id
    add_index :comments, [:request_id, :user_id]
    add_index :comments, [:user_id, :request_id]  
  end
end
