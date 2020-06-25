# frozen_string_literal: true

class Web::ApplicationController < ApplicationController
  include AuthHelper
  include PasswordResetHelper
  helper_method :current_user
end
