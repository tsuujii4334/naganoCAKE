class Public::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item.id = current_customer.cart_item.id
  end

end
