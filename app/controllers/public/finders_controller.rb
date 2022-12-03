class Public::FindersController < ApplicationController
  def finder
    @range = params[:range]
    if @range == "Customer"
    @customers =Customer.looks(params[:search], params[:word])
    else
      @post_images = PostImage.looks(params[:search], params[:word])
    end
  end
end
