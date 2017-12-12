class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price
  
  # has_many :comments

  # def comments
  #   object.comments.approved
  # end
  
  def arttibutes
    data = super
    if current_user.premium_account?
      data[:discounted_price] = object.discounted_price
    end
    data
  end
end
