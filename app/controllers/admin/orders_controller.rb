class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @postage = 800
    @total_quantity = 0
  end
end
