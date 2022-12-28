class PaymentsController < ApplicationController
  before_action :authentication,only: %i[index checkout]
  before_action :current_order,only: %i[index checkout]

  def index;end 

  def checkout
    @payments = Payment.new(payment_params)
    @payments.update(user_id: current_user.id, order_id: current_order.id)
    if check_order_items
      @order.update(status: "completed" )
      @order.orderitems.each do |orderitem|
        orderitem.product.update(amount: orderitem.product.amount - orderitem.quantity )
      end
      UserMailer.with(user: current_user ,order: @order).ordersuccess.deliver_now
      flash[:alert] = "order Success"
      redirect_to  payments_path
    else
      flash[:alert] = "not enough amount"
      redirect_to cart_index_path
    end 
  end

  private

  def payment_params
    params.permit(  :card_number, :MM_YY, :code, :name_card)
  end

  def check_order_items
    @order.orderitems.each do |orderitem|
      if orderitem.product.amount < orderitem.quantity
        return false
        break
      else
        return true
      end
    end
  end

end
