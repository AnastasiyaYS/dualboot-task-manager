require 'test_helper'

class Web::PasswordResetControllerTest < ActionController::TestCase
  include AuthHelper
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    user = create(:user)
    assert_emails 1 do
      post :create, params: { password_reset_request_form: { email: user.email } }
    end
    assert_response :redirect
  end

  test "should get edit" do
    user = create(:user, password_reset_token: '123', password_reset_sent_at: Time.zone.now)
    get :edit, params: { id: '123' }
    assert_response :success
  end

  test "should put update" do
    user = create(:developer, password_reset_token: '123', password_reset_sent_at: Time.zone.now)
    put :update, params: { developer: { password: '123', password_confirmation: '123' }, id: '123' }
    updated_user = User.find_by_email(user.email)
    assert updated_user.authenticate('123')
    assert_response :redirect
  end
end
