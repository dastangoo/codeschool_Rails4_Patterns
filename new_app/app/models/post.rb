class Post < ApplicationRecord
  
  # These two methods can be changed together.
  # def self.recent
    # where('published = ? AND published_on > ?', true, 2.days.ago)
    # where('published_on > ?', 2.days.ago)
  # end
  
  # def self.by_author(author)
    # Returns nil when no author is present
    # where(author: author) if author.present?
  #   if author.present?
  #     where(author: author)
  #   else
  #     # Returns a chainable relation
  #     all
  #   end
  # end
  
  has_many :comments
  # scope :with_approved_comments, -> { joins(:comments).where('comments.approved = ?', true) }
  scope :with_approved_comments, -> { joins(:comments).merge(Comment.approved) }
  scope :by_author, -> (author) { where(author: author) if author.present? }
  scope :recent, -> { where('published_on > ?', 2.days.ago) }
end
