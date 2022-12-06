class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
  @post_image = PostImage.new
  @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  def update
    customer = current_customer
    if customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def unsubscribe
    @customer =current_customer
  end

  def withdraw
    @customer = current_customer
    if @customer.email == 'guest@example.com'
      reset_session
      redirect_to post_images_path
    else
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
    end
  end

  private
  def customer_params
  params.require(:customer).permit(:name, :email)
  end
end
