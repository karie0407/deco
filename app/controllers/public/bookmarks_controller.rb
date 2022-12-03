class Public::BookmarksController < ApplicationController

  def create
    post_image = PostImage.find(params[:post_image_id])
    bookmark = current_customer.bookmarks.new(post_image_id: post_image.id)
    bookmark.save
    redirect_to post_image_path(post_image)
  end

  def show
  @bookmark = Bookmark.find(params[:id])
  @comment = Comment.new
  end
end
