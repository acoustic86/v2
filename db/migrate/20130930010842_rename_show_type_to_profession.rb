class RenameShowTypeToProfession < ActiveRecord::Migration
  def change
    change_table :profiles do |t|
      t.rename :show_type, :profession
    end
  end
end
