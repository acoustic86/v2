json.array!(@show_requests) do |show_request|
  json.extract! show_request, :show_date, :show_time, :description
  json.url show_request_url(show_request, format: :json)
end
