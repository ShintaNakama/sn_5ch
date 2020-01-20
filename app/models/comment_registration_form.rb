class CommentRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :user_id, :integer, default: nil
  attribute :post_id, :integer, default: nil
  attribute :comment, :string, default: nil

  def set_attributes(post, user, comment={})
    self.post_id = post[:post_id]
    self.user_id = user.id
    self.comment = comment[:comment]
    return self
  end

  def save
    comment = Comment.new(comment: self.comment, user_id: user_id, post_id: post_id)
    return false if comment.invalid?
    if comment.save
      true
    else
      false
    end
  end
end
