web: bundle exec thin start -p $PORT
default: env HEROKU_PROCESS=default bundle exec sidekiq 
update_price:  env HEROKU_PROCESS=update_price bundle exec sidekiq -q update_price 
notifications:  env HEROKU_PROCESS=notifications bundle exec sidekiq -q notifications 
