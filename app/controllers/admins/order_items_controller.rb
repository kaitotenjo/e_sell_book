class Admins::OrderItemsController < ApplicationController
  before_action :set_admins_order_item, only: %i[ edit update destroy ]
  before_action :authentication
  before_action :is_admin?
  layout"admins/base"
  def edit
  end

  def update
    byebug
    @admins_order_item.update(admins_order_item_params)
    redirect_back(fallback_location: root_path)
  end

  def delete
  end

  private 

  def set_admins_order_item
    @admins_order_item = Orderitem.find(params[:id])
  end

  def admins_order_item_params
    params.permit( :product_id, :quantity)
  end
end
