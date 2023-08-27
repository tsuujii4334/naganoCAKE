class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @orders = Order.new(order_params)
    @orders.postal_code = current_customer.postal_code
    @orders.address = current_customer.address
    @orders.name = current_customer.first_name + current_customer.last_name
    @total = 0
    @postage = 800
  end

  def completion
  end

  def create

  end

  def index
  end

  def show
  end

  private
  def order_params
      params.require(:order).permit(:payment_method, :address)
  end
end