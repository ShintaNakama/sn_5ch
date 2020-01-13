class Category < ApplicationRecord
  include CategorySearchable

  has_many :posts_categories
  has_many :posts, through: :posts_categories, source: :post

  validates :category_name, presence: true
  validates :category_name, uniqueness: true

  def self.split_category_params(category_params)
    categories = category_params.split(',')
    categories
  end
end
