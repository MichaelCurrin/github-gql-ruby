help:
	@egrep '^\S|^$$' Makefile


install:
	bundle install --path vendor/bundle

upgrade:
	bundle update


run:
	bundle exec ruby fetch_and_print.rb
