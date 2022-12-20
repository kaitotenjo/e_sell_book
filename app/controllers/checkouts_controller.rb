class CheckoutsController < ApplicationController
  before_action :authentication,only: %i[index checkout]
  before_action :current_order,only: %i[index checkout]

  def index
  end

  def checkout
    @address = Address.new(address_params)
    @address.update(user_id:@user.id)
    redirect_to payments_path
  end

  private 

  def address_params
    params.permit(  :first_name, :last_name, :N_A, :address_detail, :postal, :city, :phone)
  end
end
