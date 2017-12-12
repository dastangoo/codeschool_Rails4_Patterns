class Image < ApplicationRecord
  has_many :comments, as: :commentable

  include Commentable
end
