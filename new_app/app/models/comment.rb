class Comment < ApplicationRecord
  blongs_to :post
  scope :approved, -> { where(approved: true) }
end
