class Public::BookmarksController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    bookmark = current_customer.bookmarks.new(post_image_id: post_image.id)
    bookmark.save
    redirect_to post_image_path(post_image)
  end

  def index
  @bookmarks = current_customer.bookmarks.all
  @comment = Comment.new
  # @bookmark = Bookmark.find(params[:bookmark_id])
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    bookmark = current_customer.bookmarks.find_by(post_image_id: post_image.id)
    bookmark.destroy
    redirect_to post_image_path(post_image)
  end
end
