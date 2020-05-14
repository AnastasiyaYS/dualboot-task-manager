# frozen_string_literal: true

class Web::BoardsController < Web::ApplicationController
  before_action :authenticate_user!

  def show; end
end
