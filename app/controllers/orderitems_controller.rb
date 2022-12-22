class OrderitemsController < ApplicationController
  before_action :authentication
  before_action :set_order , only: [:create]
  

  def create
    @orderitem = @order.orderitems.new(order_params)
    @orderitem = @order.orderitems.find_by(product_id: @orderitem.product_id, order_id: @order.id)
    if params[:quantity].to_i <= Product.find_by(id: params[:product_id]).amount
      @orderitem.nil? ?  @order.save : @orderitem.update(quantity: params[:quantity])
      flash[:alert] = "Create Product Success"
    else 
      flash[:alert] = "not enough amount"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def order_params
    params.permit( :product_id, :quantity)
  end

  def set_order
    @order = current_order
  end
  
end
