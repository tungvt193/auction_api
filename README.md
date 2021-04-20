# Auction Flutter API
## _Đấu giá máy công trình_

Auction là nền tảng ứng dụng đấu giá

## Công nghệ

- [Flutter] - Flutter apps!
- [Ruby on Rails] - API graphql base on Ruby on Rails

## Installation

Dillinger requires Ruby on Rails, Flutter

Install the dependencies and devDependencies and start the server.

For Flutter App

```sh
cd auction_api
bundle install
bundle exec rails db:create
bundle exec rails migration:apply

```

To Make a User
```sh
cd auction_api
rails c
user = User.new
user.assign_attributes({
  email: 'tainv.it93@gmail.com',
  encrypted_password: user.cryptor.encrypt_and_sign('12345678')
})

user.save!
```

Start Server
```sh
rails s -b 0.0.0.0 -p 3000
```