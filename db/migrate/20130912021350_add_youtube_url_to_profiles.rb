class AddYoutubeUrlToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :youtube_url, :string
  end
end
