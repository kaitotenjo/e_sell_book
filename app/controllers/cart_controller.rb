class CartController < ApplicationController
  before_action :authentication
  before_action :get_order_items ,only: [:index,:update_quantity]

  def index; end

  def  update_quantity
    @order_items.each do |order_item|
      case 
      when params[order_item.id.to_s]=="0"
        order_item.delete
      when params[order_item.id.to_s].to_i > order_item.product.amount
        flash[:alert] = "not enough amount"
      else 
        order_item.update(quantity: params[order_item.id.to_s])
      end
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def get_order_items
    @order_items = current_order.orderitems
  end
end
