class Comment < ApplicationRecord
  # belongs_to :commentable, polymorphic: true
  belongs_to :item
  scope :approved, -> { where(approved: true) }
end
