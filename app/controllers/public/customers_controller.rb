class Public::CustomersController < ApplicationController
  def show
  @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def unsubscribe
    @customer =current_customer
  end

  def withdraw
  end
end