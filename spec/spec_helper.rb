# frozen_string_literal: true

require 'bundler/setup'
require 'webrat'
require 'rack/test'
require 'sinatra'

module SinatraSpec
  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Rack::Test::Methods
  config.include Webrat::Methods
  config.include Webrat::Matchers
  config.include SinatraSpec
end

Webrat.configure do |config|
  config.mode = :rack
end
