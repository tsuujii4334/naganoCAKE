class Public::ItemsController < ApplicationController
  def index
    @itemcount = Item.all.count
    @items = Item.all.page(params[:page]).per(8)
  end

  def show
   @item = Item.find(params[:id])
  # @cart_item = current_customer.cart_items
   @cart_item = CartItem.new
  end

end
