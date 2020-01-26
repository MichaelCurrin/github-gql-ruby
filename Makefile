help:
	@egrep '^\S|^$$' Makefile


install:
	bundle install --path vendor/bundle

upgrade:
	bundle update


token:
	. .env
	@echo "ACCESS_TOKEN: ${ACCESS_TOKEN}"


run:
	bundle exec ruby request.rb
