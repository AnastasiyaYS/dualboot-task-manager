# frozen_string_literal: true

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!('rails')
else
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryBot::Syntax::Methods
  parallelize(workers: :number_of_processors)

  fixtures :all
end
