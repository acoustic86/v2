class RemoveGoogleCalendarFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :google_calendar, :text
  end
end
