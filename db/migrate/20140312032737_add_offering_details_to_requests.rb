class AddOfferingDetailsToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :offering, :boolean
    add_column :requests, :limit, :integer
    add_column :requests, :amount, :integer
    add_column :requests, :type, :string
    add_index :requests, :type
  end
end
