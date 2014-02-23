json.array!(@profiles) do |profile|
  json.extract! profile, :description, :experience, :profession, :current_location, :name, :youtube_url, :latitude, :longitude
  json.url profile_url(profile, format: :json)
end
