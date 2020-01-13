module PostsHelper
  def category_names(post)
    return post.categories.map(&:category_name).join(',')
  end
end
