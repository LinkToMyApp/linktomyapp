class AppLinkSerializer < ActiveModel::Serializer
  attributes :referal, :link_clicks_count, :installs_count
end
