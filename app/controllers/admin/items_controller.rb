class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def new
    @items = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_show_item_path(@item.id)
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_show_item_path(item.id)
  end
  
  private
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:price)
    
  end
end
