ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  # Because we use Devise lets include the devise test helpers
  # We have to put it into ActionController::TestCase Because
  # Otherwise we error out about nomethoderror 'env' when its in ActiveSupport
  include Devise::TestHelpers
end
