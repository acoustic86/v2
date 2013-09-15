class RenameShowRequestToRequest < ActiveRecord::Migration
  def change
    rename_table :show_requests, :requests
  end
end
