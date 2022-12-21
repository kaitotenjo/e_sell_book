class HomeController < ApplicationController
  before_action :authentication
  def index
    @products=Product.all
    @new_products= @products.last(9)
    @weeklydiscounts= @products.first(6)
    @top_sells=@products.sort_by{|product| product.top_selling}.last(6)
  end

  private

end
