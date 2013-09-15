class RenameShowDateAndShowTimeToDateAndTime < ActiveRecord::Migration
  def change
    change_table :requests do |t|
      t.rename :show_date, :date
      t.rename :show_time, :time
    end
  end
end