Category.create(name: "action")
Category.create(name: "romantic")
Category.create(name: "adventure")

category1= Category.find_by(name: "action")
category2= Category.find_by(name: "romantic")
category3= Category.find_by(name: "adventure")

12.times do |n|
name = "product_body_spray #{n+1}"
price = "400"
discription=" khong biet viet gi cung duoc ha"
amount= n+2
product = Product.create(
  name:  name,
  price: price,
  discription: discription,
  amount: amount
)
product.image.attach(
  io: File.open(Rails.root.join('app','assets','images','product1.png')),
  filename: 'product1.png',
  content_type: 'image/png'
)
ProductCategory.create(product: product , category: category1)

end
13.times do |n|
name = "product_face_mask #{n+1}"
price = "34"
discription=" khong biet viet gi cung duoc ha"
amount= n+2
product = Product.create(
  name:  name,
  price: price,
  discription: discription,
  amount: amount
)
product.image.attach(
  io: File.open(Rails.root.join('app','assets','images','product2.png')),
  filename: 'product2.png',
  content_type: 'image/png'
)
ProductCategory.create(product: product , category: category2)
end
14.times do |n|
name = "product_stay_free_utra_pad #{n+1}"
price = "250"
discription=" khong biet viet gi cung duoc ha"
amount= n+2
product = Product.create(
  name:  name,
  price: price,
  discription: discription,
  amount: amount
)
product.image.attach(
  io: File.open(Rails.root.join('app','assets','images','product3.png')),
  filename: 'product3.png',
  content_type: 'image/png'
)
ProductCategory.create(product: product , category: category3)
end

user = User.new
user.email = 'admin@gmail.com'
user.password = '123qwe'
user.password_confirmation = '123qwe'
user.role = 1
user.save!

50.times do |n|

  email="user#{n+1}@gmail.com"
  password= "123qwe"
  password_confirmation= "123qwe"
User.create(
  email: email,
  password: password,
  password_confirmation:password_confirmation
)
end