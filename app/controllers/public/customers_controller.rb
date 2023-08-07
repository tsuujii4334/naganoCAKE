class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @orders = Order.all
  end

  def edit
  end
  
  def update
  end

  def confirm
  end
  
  def withdrawal
    @customer = Customer.find(params[:id])
    @customer.update(is_daketed: true)
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end
end
