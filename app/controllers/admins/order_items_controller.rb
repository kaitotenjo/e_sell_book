class Admins::OrderItemsController < ApplicationController
  before_action :set_admins_order_item, only: %i[ edit update destroy ]
  before_action :authentication
  before_action :is_admin?
  layout"admins/base"

  def new
    @admins_order_item = Orderitem.new
  end

  def edit
  end

  def create
    @admins_order_item = Orderitem.new(admins_order_item_params)
    @admins_order_item.save
    redirect_back(fallback_location: root_path)
  end

  def update
    @admins_order_item.update(admins_order_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @admins_order_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private 

  def set_admins_order_item
    @admins_order_item = Orderitem.find(params[:id])
  end

  def admins_order_item_params
    params.permit( :order_id,:product_id, :quantity)
  end
end
