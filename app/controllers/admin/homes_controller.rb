class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.order(created_at: :desc).page(params[:page])#order(created_at: :desc)で並び順を
  end
end
