class RenameClientIdToUserIdInShowRequests < ActiveRecord::Migration
  def self.up
    rename_column :show_requests, :client_id, :user_id    
  end

  def self.down
    rename_column :show_requests, :user_id, :client_id    
  end
end