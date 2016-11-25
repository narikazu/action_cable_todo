# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * 2.3.1
* System dependencies
  * MySQL
  * PostgreSQL
    * `brew install postgresql`
* Deployment instructions
  * Local
    * `bundle install`
    * `bundle exec rails db:create`
    * `bundle exec rails db:migrate`
    * `bundle exec rails s`
  * Heroku
    * `heroku create`
    * `heroku addons:create heroku-redis`
    * `git push heroku master`
    * `heroku run rails db:migrate`
    * `heroku open`
  * Docker
    * `docker-compose build`
    * `docker-compose run --rm app rake db:create`
    * `docker-compose run --rm app rake db:migrate`
    * `docker-compose up`
