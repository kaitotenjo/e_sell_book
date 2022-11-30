class CartController < ApplicationController
  before_action :authentication
  before_action :get_order_items ,only: [:index,:update_quantity]

  def index; end

  def  update_quantity
    @order_items.each do |order_item|
      if params[order_item.id] == "0"
        order_item.delete
      else
        order_item.update_attribute(:quantity,params[order_item.id.to_s])
      end
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def get_order_items
    @order_items = current_order.orderitems
  end
end
