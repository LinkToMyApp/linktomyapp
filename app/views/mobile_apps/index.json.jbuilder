json.array!(@mobile_apps) do |mobile_app|
  json.extract! mobile_app, :name, :itunes_url, :icon_url
  json.url mobile_app_url(mobile_app, format: :json)
end
