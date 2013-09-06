class AddProfileIdToShowRequests < ActiveRecord::Migration
  def change
    add_column :show_requests, :profile_id, :integer
    add_column :show_requests, :client_id, :integer
    
    add_index :show_requests, :profile_id
    add_index :show_requests, :client_id
    add_index :show_requests, [:profile_id, :client_id] 
    add_index :show_requests, [:client_id, :profile_id, ] 
  end  
end