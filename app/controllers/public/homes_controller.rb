class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc).page(params[:page]).per(4)#新着順、ページネーション、４件
  end

  def about
  end
end
