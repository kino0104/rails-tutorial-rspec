source 'https://rubygems.org'

gem 'rails',        '5.1.4'
gem 'bootstrap-sass', '3.3.7'
gem 'puma',         '3.9.1'
gem 'sass-rails',   '5.0.6'
gem 'uglifier',     '3.2.0'
gem 'coffee-rails', '4.2.2'
gem 'jquery-rails', '4.3.1'
gem 'turbolinks',   '5.0.1'
gem 'jbuilder',     '2.7.0'
gem 'mysql2', '>= 0.3.18', '< 0.5'

group :development, :test do
  gem 'rspec-rails', '~> 3.6.0'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem 'byebug',  '9.0.6', platform: :mri
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console',           '3.5.1'
  gem 'listen',                '3.1.5'
  gem 'spring',                '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'faker', require: false
  gem 'spring-commands-rspec'
end

group :test do
  gem 'rails-controller-testing', '1.0.2'
  gem 'minitest-reporters',       '1.1.14'
  gem 'guard',                    '2.13.0'
  gem 'guard-rspec', require: false
  gem 'capybara', '~> 2.15.2'
  gem 'launchy', '~> 2.4.3'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
end

group :production do
  gem 'pg', '0.20.0'
end

# Windows環境ではtzinfo-dataというgemを含める必要があります
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]