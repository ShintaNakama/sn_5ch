class CommentRegistrationForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :user_id, :integer, default: nil
  attribute :post_id, :integer, default: nil
  attribute :comment, :string, default: nil

  def save!
    raise ActiveRecord::RecordInvalid if invalid?
    comment = Comment.new(comment: self.comment, user_id: user_id, post_id: post_id)
    comment.save!
  end
end
