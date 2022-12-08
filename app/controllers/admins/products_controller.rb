class Admins::ProductsController < ApplicationController
  before_action :set_admins_product, only: %i[ show edit update destroy ]
  layout"admins/base"

  # GET /admins/products or /admins/products.json
  def index
    @products = Product.all
  end

  # GET /admins/products/1 or /admins/products/1.json
  def show
  end

  # GET /admins/products/new
  def new
    @product = Product.new
  end

  # GET /admins/products/1/edit
  def edit
    @product_category= @product.product_categories
    @categories= Category.all
  end

  # POST /admins/products or /admins/products.json
  def create
    @product = Product.new(admins_product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admins_product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/products/1 or /admins/products/1.json
  def update
    respond_to do |format|
      if @product.update(admins_product_params)
        format.html { redirect_to admins_product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/products/1 or /admins/products/1.json
  def destroy
    @product.destroy
    
    respond_to do |format|
      format.html { redirect_to admins_products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admins_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admins_product_params
      params.permit( :name, :price, :discription, :amount, :image, pictures:[])
    end
end
