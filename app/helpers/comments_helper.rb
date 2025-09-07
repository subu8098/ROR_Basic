module CommentsHelper
  def comments_count(article)
    #used in app/views/comments/_comment.html.erb

    if article.comments.any?
      "#{article.comments.count} comments available"
    else
      "No comments yet"
    end
  end
end
