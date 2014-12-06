source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.1.6'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'unicorn'
gem 'foreman'
gem 'slim-rails'
gem 'kaminari'

gem 'omniauth-facebook'
gem 'devise'

gem 'bootstrap-sass'
gem 'bootstrap-sass-extras'
gem 'font-awesome-rails'
gem 'compass-rails'

gem 'rails_autolink'

gem 'rails-i18n'
gem 'devise-i18n'

gem 'pry-rails'
gem 'awesome_print'

group :development, :test do
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'tapp'
  gem 'quiet_assets'

  gem 'rspec-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-livereload', require: false
end

group :development do
  gem 'rack-mini-profiler'
  gem 'letter_opener'
  gem 'meta_request'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rails-footnotes'
  gem 'rails-erd'
end

group :test do
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'fuubar', '~> 2.0.0.rc1'
  gem 'webmock'
  gem 'simplecov', '~> 0.7.1', require: false
end

# related deploy
#gem 'whenever', require: false

group :deployment do
  gem 'capistrano', '~> 3.2.1'
  gem 'capistrano-rails'
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano-bundler'
  gem 'capistrano3-unicorn'
end
