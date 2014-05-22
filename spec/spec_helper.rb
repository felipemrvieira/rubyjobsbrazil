require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] = 'test'

# TODO remvoe when warning is fixed
require 'minitest/autorun'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'webmock/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Features, type: :feature
  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.use_transactional_fixtures = false
end

# Capybara.javascript_driver = :webkit
WebMock.disable_net_connect!(allow_localhost: true)

Capybara.configure do |config|
  config.always_include_port = true
  config.app_host = 'http://rubyjobsbrazil.com'
end
