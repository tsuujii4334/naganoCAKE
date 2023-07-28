class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page])
  end

  def new
    @items = Item.new
  end
  
  def create
    
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
  
  def update
    
  end
  
  private
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:price)
    
  end
end
