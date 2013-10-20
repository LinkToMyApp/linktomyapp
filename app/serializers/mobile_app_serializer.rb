class MobileAppSerializer < ActiveModel::Serializer
  attributes :name, :itunes_url, :icon_url
end
