class Product < ApplicationRecord
    has_many :product_categories ,dependent: :destroy
    has_many :categories, through: :product_categories
    has_many :orderitems
    has_one_attached :image
    has_many_attached :pictures
    has_rich_text :body
    after_commit :add_default_image, on:%i[create update] 

    private

    def add_default_image
        return if image.attached?
        
            image.attach(
              io: File.open(Rails.root.join('app','assets','images','product_default_image.jpg')),
              filename: 'product_default_image.jpg',
              content_type: 'image/jpg'
      
            )
    end
end
