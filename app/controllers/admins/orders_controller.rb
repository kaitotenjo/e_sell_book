class Admins::OrdersController < ApplicationController
  before_action :set_admins_order, only: %i[ show edit update destroy ]
  layout"admins/base"

  # GET /admins/orders or /admins/orders.json
  def index
    @admins_orders = Order.all
  end

  # GET /admins/orders/1 or /admins/orders/1.json
  def show
  end

  # GET /admins/orders/new
  def new
    @admins_order = Order.new
  end

  # GET /admins/orders/1/edit
  def edit
  end

  # POST /admins/orders or /admins/orders.json
  def create
    @admins_order = Order.new(admins_order_params)

    respond_to do |format|
      if @admins_order.save
        format.html { redirect_to admins_order_url(@admins_order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @admins_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @admins_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/orders/1 or /admins/orders/1.json
  def update
    respond_to do |format|
      if @admins_order.update(admins_order_params)
        format.html { redirect_to admins_order_url(@admins_order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @admins_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @admins_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/orders/1 or /admins/orders/1.json
  def destroy
    @admins_order.destroy

    respond_to do |format|
      format.html { redirect_to admins_orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_order
      @admins_order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_order_params
      params.fetch(:admins_order, {})
    end
end
