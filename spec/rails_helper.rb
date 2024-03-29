require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'support/factory_bot'
require 'support/database_cleaner'


# Apartment::Tenant.drop( "test-tenant" ) rescue nil
# Apartment::Tenant.create( "test-tenant" ) rescue nil
# Apartment::Tenant.switch!( "demo" )


ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

end
