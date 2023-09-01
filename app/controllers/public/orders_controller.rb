class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.addressee = current_customer.full_name
    @total = 0
    @postage = 800 #postage→送料
  end

  def completion
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_completion_path
  end

  def index
    @orders = current_customer.orders.all
    @order_details = order.order_details
    @items = @order_details.item.all
  end

  def show
    @order = Order.find(params[:id])
    @postage = 800
    @order_details = @order.order_details
    @item = @order_details.item
  end

 private
  def order_params
      params.require(:order).permit(:payment_method, :address, :postal_code, :total_amount, :postage, :addressee)
  end
end