json.array!(@link_clicks) do |link_click|
  json.extract! link_click, :app_link_id, :ip_adress, :occurence_counter, :installed
  json.url link_click_url(link_click, format: :json)
end
