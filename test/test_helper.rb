# frozen_string_literal: true

require 'coveralls'
Coveralls.wear!('rails')

require 'simplecov'
SimpleCov.formatter = Coveralls::SimpleCov::Formatter
SimpleCov.start do
  add_filter 'app/secrets'
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
