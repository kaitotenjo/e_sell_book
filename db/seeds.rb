Category.create(name: "action")
Category.create(name: "romantic")
Category.create(name: "adventure")

category1= Category.find_by(name: "action")
category2= Category.find_by(name: "romantic")
category3= Category.find_by(name: "adventure")

12.times do |n|
name = "dragon ball tap #{n+1}"
price = "17500"
discription=" khong biet viet gi cung duoc ha"
amount= n+1
product = Product.create(
    name:  name,
    price: price,
    discription: discription,
    amount: amount
)
ProductCategory.create(product: product , category: category1)

end
13.times do |n|
name = "bleach tap #{n+1}"
price = "17500"
discription=" khong biet viet gi cung duoc ha"
amount= n+1
product = Product.create(
    name:  name,
    price: price,
    discription: discription,
    amount: amount
)
ProductCategory.create(product: product , category: category2)
end
14.times do |n|
name = "one piece tap #{n+1}"
price = "17500"
discription=" khong biet viet gi cung duoc ha"
amount= n+1
product = Product.create(
    name:  name,
    price: price,
    discription: discription,
    amount: amount
)
ProductCategory.create(product: product , category: category3)
end

User.create(
    email: "admin@email.com",
    password: "123qwe",
    password_confirmation: "123qwe",
    role:1
)
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