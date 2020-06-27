class PasswordResetService
  def initialize(user)
    @user = user
  end

  def send_password_reset
    generate_token(:password_reset_token, @user)
    @user.password_reset_sent_at = Time.zone.now
    @user.save!
    UserMailer.forgot_password(@user).deliver_now
  end

  def generate_token(column, user)
    begin
      user[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => user[column])
  end
end
