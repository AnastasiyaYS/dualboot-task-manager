# frozen_string_literal: true

require 'test_helper'

class Web::DevelopersControllerTest < ActionController::TestCase
  include AuthHelper
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    post :create, params: { developer: attributes_for(:developer) }
    assert_response :redirect
    assert signed_in?
    assert_equal current_user.type, 'Developer'
  end
end
