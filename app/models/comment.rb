class Comment < ApplicationRecord
  include CommentSearchable
  belongs_to :user
  belongs_to :post

  validates :comment, presence: true
end
