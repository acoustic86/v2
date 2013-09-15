json.array!(@requests) do |request|
  json.extract! request, :date, :time, :description
  json.url request_url(request, format: :json)
end
