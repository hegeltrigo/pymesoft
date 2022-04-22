source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# ruby '2.5.1'

gem 'rails', '~> 5.2.0'
gem "pg", "~> 0.18"
gem 'puma', '3.10.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-table-rails'
gem 'bootstrap-datepicker-rails'
gem 'faker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development, :test do
  gem "factory_bot_rails"
  gem "database_cleaner"
  gem "rspec-rails"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem "selenium-webdriver"
  gem 'chromedriver-helper'
end

gem 'toastr-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'webpacker'
gem 'foreman'
gem 'devise'
gem 'jquery-validation-rails'
gem 'apartment'
gem "letter_opener", :group => :development
gem 'webpacker-react', "~> 0.3.1"
gem 'rails-i18n'
# gem 'simple_token_authentication', '~> 1.0' # see semver.org
gem 'rack-cors', :require => 'rack/cors'
gem 'gon'

gem 'devise-jwt', '~> 0.5.8'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'kaminari'
gem "ransack", "~> 2.3"

gem 'complicode', :git => 'https://github.com/nibirutechnologies/complicode-ruby.git', :branch => 'develop'

gem 'numbers_and_words', :git => 'https://github.com/kslazarev/numbers_and_words.git'

gem 'caxlsx_rails'

gem 'wicked_pdf'

gem 'wkhtmltopdf-binary'

gem 'rqrcode_png', git: "https://github.com/DCarper/rqrcode_png.git"

group :development do
  gem 'capistrano', '~> 3.11'
  gem 'capistrano-rails', '~> 1.4'
  # Add this if you're using rbenv
  #gem 'capistrano-rbenv', github: "capistrano/rbenv"
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'capistrano-yarn'
  gem 'capistrano-foreman'

end
