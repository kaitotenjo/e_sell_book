class Order < ApplicationRecord
    has_many :orderitems
    has_one :payment
    belongs_to :user
    before_save :set_subtotal
    enum status: [ :pending , :completed]
    has_many :addresses
  
    def subtotal
      orderitems.collect { |orderitem| orderitem.valid? ? orderitem.product.price * orderitem.quantity : 0 }.sum
    end
  
    private
  
    def set_subtotal
      self.subtotal = subtotal
    end

    def change_amount
    end
end
