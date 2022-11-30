class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable
  has_many :orders
  has_many :payments
  has_one_attached :avatar
  enum role: [:user ,:admin]
  after_commit :add_default_avatar, on:%i[create update] 
  # after_commit :add_default_name, on:%i[create update]
  
  def avatar_thumbnail
    avatar.variant(resize_to_limit: [150,150]).processed
  end

  private

  def add_default_avatar
  return if avatar.attached?
  
      avatar.attach(
        io: File.open(Rails.root.join('app','assets','images','default_avatar.jpg')),
        filename: 'default_avatar.jpg',
        content_type: 'image/jpg'

      )
  end

  # def add_default_name
  # end
end
