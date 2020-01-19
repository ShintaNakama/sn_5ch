class Post < ApplicationRecord
  include PostSearchable

  belongs_to :user
  has_many :comments
  has_many :posts_categories
  has_many :categories, through: :posts_categories, source: :category

  validates :title, presence: true
  validates :body, presence: true

  def set_categories(category_names)
    category_names.reject!(&:blank?)
    return if category_names.size.zero?
    category_names.each do |category_name|
      self.categories << Category.find_or_initialize_by(category_name:category_name)
    end
  end
end
