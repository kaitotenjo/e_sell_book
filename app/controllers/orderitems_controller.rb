class OrderitemsController < ApplicationController
  before_action :set_order , only: [:create,:update_quantity]
  before_action :check_login , only: [:create]

  def create
    @orderitem = @order.orderitems.new(order_params)
    if @order.orderitems.find_by(product_id: @orderitem.product_id).nil? 
      @order.save
      redirect_back(fallback_location: root_path)
    else 
      @orderitem = @order.orderitems.find_by(product_id: @orderitem.product_id)
      @orderitem.update_attribute(:quantity,params[:quantity])
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def order_params
    params.permit(  :product_id,:quantity)
  end

  def set_order
    @order = current_order
  end
  
end
