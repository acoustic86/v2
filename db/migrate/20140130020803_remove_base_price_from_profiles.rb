class RemoveBasePriceFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :base_price, :integer
  end
end
