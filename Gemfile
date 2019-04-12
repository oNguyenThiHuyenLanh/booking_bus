source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.5"
gem "mysql2"
gem "puma", "~> 3.7"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "paranoia"
gem "select2-rails"
gem "bootstrap-sass"
gem "jquery-rails"
gem "bootstrap-datepicker-rails"
gem "font-awesome-rails"
gem "factory_bot_rails"
gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "byebug"
gem "font-awesome-sass", "~> 5.0.6"
gem "i18n-js"
gem "devise"
gem "jquery-validation-rails"
gem "bootstrap-select-rails"
gem "config"
gem "chartjs-rails"
gem "bullet"
gem "kaminari"
gem "bootstrap-kaminari-views"

group :development, :test do
  gem "pry"
  gem "pry-byebug"
  gem "figaro"
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
  gem "rspec"
  gem "rspec-rails"
  gem "rspec-collection_matchers"

  gem "better_errors"
  gem "guard-rspec", require: false
  gem "database_cleaner"
  gem "brakeman", require: false
  gem "bundler-audit"
  gem "rubocop", "~> 0.35.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "eslint-rails", git: "https://github.com/octoberstorm/eslint-rails", require: false
  gem "scss_lint", require: false
  gem "scss_lint_reporter_checkstyle", require: false
  gem "rails_best_practices"
  gem "reek"
  gem "railroady"
  gem "autoprefixer-rails"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5","< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "capistrano"
  gem "capistrano3-puma"
  gem "capistrano-rails", require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rvm"
end

group :test do
  gem "simplecov", require: false
  gem "simplecov-rcov", require: false
  gem "simplecov-json"
  gem "shoulda-matchers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
