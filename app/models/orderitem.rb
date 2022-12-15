class Orderitem < ApplicationRecord
  belongs_to :order
  before_save :set_price
  before_save :set_total
  belongs_to :product

  def until_price
    product.price
  end

  def total
    until_price.to_f * quantity
  end

  private

  def set_price
    self[:until_price] = until_price
  end

  def set_total
    self.total = total
  end
end
