class Admins::OrderItemsController < ApplicationController
  before_action :set_admins_order_item, only: %i[ edit update destroy ]
  layout"admins/base"
  def edit
  end

  def update
    byebug
  end

  def delete
  end

  private 

  def set_admins_order_item
    @admins_order_item = Orderitem.find(params[:id])
  end
end
