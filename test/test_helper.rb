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
require 'sidekiq/testing'

class ActiveSupport::TestCase
  include AuthHelper
  include FactoryBot::Syntax::Methods
  include ActionMailer::TestHelper
  parallelize(workers: :number_of_processors)

  fixtures :all
  
  Sidekiq::Testing.inline!
end
