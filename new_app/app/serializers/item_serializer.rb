class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :url
  
  def url
    item_url(object)
  end
end
