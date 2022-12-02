class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  def new
    @post = Post.new
  end

  def create
    post = Post.new(post_params)
    post.customer_id = current_customer.id
    if post.save
      redirect_to post_path(post.id)
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def post_params
    params.require(:post).permit(:title, :introduction, :image, :customer_id)
  end
end
