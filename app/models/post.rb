class Post < ApplicationRecord
  include PostSearchable

  belongs_to :user
  has_many :comments
  has_many :posts_categories
  has_many :categories, through: :posts_categories, source: :category

  validates :title, presence: true
  validates :body, presence: true

end
