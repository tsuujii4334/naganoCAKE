class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    @orders = Order.all
  end

  def edit
    @customer = current_customer
  end
  
  def update
  end

  def confirm
    @customer = Customer.find(current_customer.id)
  end
  
  def withdrawal
    @customer = Customer.find(current_customer.id)
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end
end
