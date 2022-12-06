class Public::MessagesController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    message = current_customer.messages.new(message_params)
    message.post_image_id = post_image.id
    message.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def message_params
    params.require(:message).permit(:message)
  end
end
