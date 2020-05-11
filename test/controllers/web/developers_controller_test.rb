# frozen_string_literal: true

require 'test_helper'

class Web::DevelopersControllerTest < ActionController::TestCase
  include AuthHelper
  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    attrs = attributes_for(:developer)
    email = attrs[:email]
    post :create, params: { developer: attrs }
    assert_response :redirect
    assert_equal current_user.type, 'Developer'
    assert_equal Developer.last.email, email
  end
end
