class Admin::OrdersController < ApplicationController
  
  def show
    @order_detail = order_detail.find(params[:id])
    @postage = 800
  end
end
