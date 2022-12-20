class Orderitem < ApplicationRecord
  belongs_to :order
  before_save :set_price
  before_save :set_total
  belongs_to :product
  before_save :add_top_selling

  def until_price
    product.price
  end

  def total
    until_price.to_f * quantity
  end

  private

  def add_top_selling
    product.update(top_selling: product.top_selling+=1 )
  end

  def set_price
    self.until_price = until_price
  end

  def set_total
    self.total = total
  end
end
