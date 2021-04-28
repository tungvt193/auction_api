# Auction API
## _Đấu giá máy công trình_

Auction platform

## Technology

- [Flutter] - Flutter apps!
- [Ruby on Rails] - API graphql base on Ruby on Rails
- [MySQL] - MySQL database
- [ImageMagick] - For upload file

## Installation

Auction requires Ruby on Rails, Flutter, MySQL, Redis
Install the dependencies and devDependencies and start the server.
- [MySQL](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04)
- [Ruby on Rails - Ruby 2.6.5](https://gorails.com/setup/ubuntu/18.04)

Install Optimizing Image
```sh
sudo apt-get install -y jpegoptim
```

Install ImageMagick
```sh
sudo apt-get install imagemagick libmagickwand-dev -y
```
Make MySQL User
```sh
CREATE USER 'auction'@'localhost' IDENTIFIED BY 'auction';
GRANT ALL PRIVILEGES ON * . * TO 'auction'@'localhost';
FLUSH PRIVILEGES;
```
Migration Database
```sh
cd auction_api
bundle install
bundle exec rails db:create
bundle exec rails migration:apply
bundle exec rails db:seed
```
Start Server
```sh
rails s -b 0.0.0.0 -p 3000
```