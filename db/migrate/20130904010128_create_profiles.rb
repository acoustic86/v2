class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :experience
      t.string :show_type
      t.text :current_location
      t.integer :base_price

      t.timestamps
    end
  end
end
