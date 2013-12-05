class AddPriceToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :price, :decimal, :precision => 8, :scale => 2
  end
end
