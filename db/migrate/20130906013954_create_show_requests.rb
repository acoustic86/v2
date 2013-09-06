class CreateShowRequests < ActiveRecord::Migration
  def change
    create_table :show_requests do |t|
      t.date :show_date
      t.time :show_time
      t.text :description

      t.timestamps
    end
  end
end
