json.array!(@profiles) do |profile|
  json.extract! profile, :first_name, :last_name, :description, :experience, :show_type, :current_location, :base_price
  json.url profile_url(profile, format: :json)
end
