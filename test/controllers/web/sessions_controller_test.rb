# frozen_string_literal: true

require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  test 'should get new' do
    get :new
    assert_response :success
  end

  test "should post create" do
    password = generate(:string)
    user = create(:user, { password: password })
    attrs = {
      email: user.email,
      password: password
    }
    post :create, params: { session_form: attrs }
    assert_response :redirect
    assert_redirected_to :board
  end
  
  test "should delete destroy" do
    delete :destroy
    assert_response :redirect
    assert_redirected_to :new_session
  end
end
