json.array!(@app_links) do |app_link|
  json.extract! app_link, :mobile_app_id, :referal, :clicks_counter, :unique_visitor_counter
  json.url app_link_url(app_link, format: :json)
end
