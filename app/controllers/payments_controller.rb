class PaymentsController < ApplicationController
  before_action :authentication,only: %i[index checkout]
  before_action :current_order,only: %i[index checkout]

  def index;end 

  def checkout
    @payments = Payment.new(payment_params)
    @payments.update(user_id: current_user.id, order_id: current_order.id)
    @order.update_attribute(:status ,"completed")
    redirect_to root_path
  end

  private

  def payment_params
    params.permit(  :card_number, :MM_YY, :code, :name_card)
  end
end
