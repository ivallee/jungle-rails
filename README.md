# Jungle

A mini e-commerce application built with Rails 4.2. A student project to simulate inheriting a pre-existing codebase, where students add new features to the app.

## Screenshots

Main product page: 
![Main product page](https://github.com/ivallee/jungle-rails/blob/master/docs/screen1.png?raw=true)

Product detail: 
![Product detail](https://github.com/ivallee/jungle-rails/blob/master/docs/screen2.png?raw=true)

Cart page: 
![Cart page](https://github.com/ivallee/jungle-rails/blob/master/docs/screen3.png?raw=true)

Admin product page: 
![Admin product page](https://github.com/ivallee/jungle-rails/blob/master/docs/screen4.png?raw=true)


## Setup

1. Clone the repository
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. Enter expiry date after today and and CVV above 0

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
