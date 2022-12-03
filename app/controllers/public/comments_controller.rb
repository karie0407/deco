class Public::CommentsController < ApplicationController
  def create
    bookmark = Bookmark.find(params[bookmark_id])
    comment = current_customer.comments.new(comment_params)
    comment.bookmark_id = bookmark.id
    comment.save
    redirect_to bookmark_path(bookmark)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
