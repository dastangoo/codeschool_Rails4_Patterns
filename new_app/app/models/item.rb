class Item < ApplicationRecord
  belongs_to :user
  
  def publish
    if !is_approved? || user == 'Loblaw'
      return false
    end
    
    self.published_on = Time.now
    self.save
  end
end
