class PasswordResetForm
  include ActiveModel::Model

  attr_accessor(
    :email,
    :password,
    :password_confirmation,
  )

  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  def send_password_reset(user)
    generate_token(:password_reset_token, user)
    user.password_reset_sent_at = Time.zone.now
    user.save!
    UserMailer.forgot_password(user).deliver_now
  end

  def generate_token(column, user)
    begin
      user[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => user[column])
  end
end
