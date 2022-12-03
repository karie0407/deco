class Public::BookmarksController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    bookmark = current_customer.bookmarks.new(post_id: post.id)
    bookmark.save
    redirect_to post_path(post)
  end

  def show
  @bookmark = Bookmark.find(params[:id])
  @comment = Comment.new
  end

  def destroy
    post = Post.find(params[:post_id])
    bookmark = current_customer.bookmarks.find_by(post_id: post.id)
    bookmark.destroy
    redirect_to post_path(post)
  end
end
