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
    @customer = Customer.find_by(customer: params[:customer])
  end
  
  def withdrawal
    @customer = Customer.find_by(customer: params[:customer])
    @customer.update(is_daketed: true)
    flash[:notice] = "退会処理を実行いたしました。"
    reset_session
    redirect_to root_path
  end
end
