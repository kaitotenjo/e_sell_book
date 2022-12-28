class CheckoutsController < ApplicationController
  before_action :authentication,only: %i[index checkout]
  before_action :current_order,only: %i[index checkout]
  before_action :set_address,only: %i[index]

  def index
    @address= Address.new
  end

  def checkout
    @address = Address.new(address_params)
    @address.update(user_id:@user.id, order_id:current_order.id)
    redirect_to payments_path
  end

  private 

  def address_params
    params.permit(  :first_name, :last_name, :N_A, :address_detail, :postal, :city, :phone)
  end

  def set_address
    @address= Address.find_by(user_id: @user.id)
  end
end
