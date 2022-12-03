class Public::PostImagesController < ApplicationController
  before_action :authenticate_customer!
  before_action :guest_check
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.customer_id = current_customer.id
    if @post_image.save
      redirect_to post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      redirect_to post_images_path
    else
      render :edit
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end


  def guest_check
    if current_customer == Customer.find(1)
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
  end
  def post_image_params
    params.require(:post_image).permit(:title, :introduction, :image, :customer_id)
  end
end