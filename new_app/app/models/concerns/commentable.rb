module commentable
  extend ActiveSupport::Concern
  # def self.included(base)
  #   base.class_eval do
  #     has_many :comments, as: :commentable
  #   end
  # end

  module ClassMethods
    def upvote(comment)
      
    end
  end
  included do
    # Runs in the context of the target class
    has_many :comments, as: :commentable
  end
  def comments_by_user(id)
    comments.where(user_id: id)
  end
end