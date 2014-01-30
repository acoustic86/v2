class RemoveFirstNameFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :first_name, :string
  end
end
