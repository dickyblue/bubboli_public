web: bundle exec thin start -p $PORT
default: env HEROKU_PROCESS=default bundle exec sidekiq -r ./background/boot.rb
update_price:  env HEROKU_PROCESS=update_price bundle exec sidekiq -q update_price -c 1 -r ./background/boot.rb
notifications:  env HEROKU_PROCESS=notifications bundle exec sidekiq -q notifications -c 1 -r ./background/boot.rb
