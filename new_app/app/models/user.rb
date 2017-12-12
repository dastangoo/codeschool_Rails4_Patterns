class User < ApplicationRecord
  # before_action :set_token

  has_many :items
  has_many :reviews
  
  # before_action :set_name
  
  # # def suspend!
  #   # Transactions ensure all enclosing database operations are atomic
  #   self.class.transaction do
  #     # self.update!(is_approved: false)
  #     disapprove_user!
  #     # self.items.each { |item| item.update!(is_approved: false) }
  #     disapprove_items!
  #     # self.reviews.each { |review| review.update!(is_approved: false) }
  #     disapprove_reviews!
  #   end
  # end
  
  # def disapprove_user!
  # 
  # end
  # 
  # def disapprove_items!
  # 
  # end
  # 
  # def disapprove_reviews!
  # 
  # end
  
  def suspend
    @user = User.find(params[:id])
    suspension = UserSuspension.new(@user)
    suspension.create!
    redirect_to @user, notice: 'Successfully suspended.'
  end
  
  scope :active, -> { where(state: 'active') }
  scope :inactive, -> { where(state: 'inactive') }
  
  # In Rails 3 query in the last scope overrides the first one
  # In Rails 4 appends the condition and if you want to do like Rails 3, you need to use merge: User.active.merge(User.inactive)
  
  protected
  
    # def set_token
    #   self.token = TokenGenerator.create(self)
    # end
    
    # def register
    #   self.token = TokenGenerator.create(self)
    #   save
    # end
    
    # def set_name
    #   self.name = self.login.capitalize if name.blank?
    # end
    
    
end
