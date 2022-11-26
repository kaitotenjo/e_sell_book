Category.create!(name: "action")
Category.create!(name:" romantic")

category= Category.first

50.times do |n|
name = "dragon ball tap#{n+1}"
price = "17500"
discription=" khong biet viet gi cung duoc ha"
amount= n+1
product = Product.create(
    name:  name,
    price: price,
    discription: discription,
    amount: amount
)
ProductCategory.create(product: product , category: category)
end