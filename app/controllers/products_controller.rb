class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authentication

  # GET /products or /products.json
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).includes([:image_attachment]).page(params[:page]).per(6)
    case params[:q]
      when "category_search"
        @products= Product.joins(:categories).joins(:product_categories).where(product_categories: {category_id: params[:search]}).includes([:image_attachment]).page(params[:page]).per(6)
      when "top_selling"
        @products= Kaminari.paginate_array(Product.all.sort_by{|product| product.top_selling}.last(6)).page(params[:page]).per(6)
      else
    end
    @categories= Category.all
  end

  # GET /products/1 or /products/1.json
  def show
   @new_products = Product.last(9)
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.permit( :name, :price, :discription, :amount, :image, pictures:[])
    end
end
