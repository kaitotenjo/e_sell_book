class PaymentsController < ApplicationController
  before_action :check_login,only: %i[index checkout]
  before_action :current_order,only: %i[index checkout]

  def index;end 

  def checkout
    @payments = Payment.new(payment_params)
    @order.update_attribute(:status ,"completed")
    byebug
    @payments.update(:user_id => current_user.id, :order_id=> current_order.id)
    redirect_to root_path
  end

  private

    def payment_params
      params.permit(  :card_number, :MM_YY, :code, :name_card)
    end

end
