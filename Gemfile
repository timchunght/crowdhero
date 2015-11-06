source 'https://rubygems.org'
ruby '2.1.5'

# Framework and core dependencies
gem 'rails', '4.1.6'
gem 'pg'
gem 'unicorn'
gem 'foreman'
gem 'rails4_upgrade', github: 'alindeman/rails4_upgrade'
# gem 'crowdtilt', github: 'Crowdtilt/crowdtilt-gem'
gem 'devise', '~> 3.2.0'
gem 'nokogiri'
gem 'friendly_id', '~> 4.0.9'
gem 'iso_country_codes'
gem 'paperclip'
gem 'ckeditor'
gem 'aws-sdk'
gem 'active_model_serializers'
gem 'momentjs-rails'
# Front-end
gem 'bootstrap-sass', '2.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'

group :production do
  gem 'newrelic_rpm'
  gem 'lograge'
end

gem 'sass-rails',   '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
# Gems used only for assets and not required
# in production environments by default.
# group :assets do
  
#   gem 'sass-rails',   '~> 3.2.3'
#   gem 'coffee-rails', '~> 3.2.1'
#   gem 'uglifier', '>= 1.0.3'
#   gem 'asset_sync'
# end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'shoulda'
end

group :development do
  gem 'quiet_assets'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'email_spec'
end
