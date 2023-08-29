class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @total = 0
    @postage = 800 #postage→送料
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
  def order_detail_parans

  end

  def order_params
      params.require(:order).permit(:payment_method, :address)
  end
end