class AddGoogleCalendarToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :google_calendar, :text
  end
end
