##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [3.1.2]
- Rails [7.0.4]

##### 1. Check out the repository

```bash
git clone https://github.com/kaitotenjo/e_sell_book.git
```

##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
rake db:create
rake db:migrate
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
rails s
```

And now you can visit the site with the URL http://localhost:3000
##### 4. Support
Web:
- [x] Sử dụng devise làm chức năng: Login, Logout, forgot password, Register, Remember 
- [x] Sử dụng sendgrid or gmail để setup SMTP  làm chức năng sendmail
- [x] Dùng background job để send mail
- [x] Tạo  seed sản phẩm theo category để import db 
- [x] Hiển thị list sản phẩm theo danh mục , tìm kiếm sản phẩm
- [x] Hiển thị chi tiết sản phẩm 
- [x] Add cart và checkout

Admin: 
- [ ] Login, logout 
- [ ] quản lý sản phẩm 
- [ ] quản lý user
- [ ] quản lý order 

