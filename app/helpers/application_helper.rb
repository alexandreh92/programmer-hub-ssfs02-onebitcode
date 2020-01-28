# frozen_string_literal: true

module ApplicationHelper
  def liked?(user, post)
    user.likes.find_by(post_id: post.id)
  end
end
