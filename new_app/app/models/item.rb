class Item < ApplicationRecord

  has_many :comments
  
  def publish
    if !is_approved? || user == 'Loblaw'
      return false
    end
    
    self.published_on = Time.now
    self.save
  end
  
  # def as_json(params={})
  #   super(except: [:created_at, :updated_at], include: { comments: { only: :id }})
  # end
  
  def active_model_serializer
    SomeOtherSerializer
  end
end
