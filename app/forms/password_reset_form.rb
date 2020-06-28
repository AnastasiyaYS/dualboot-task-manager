class PasswordResetForm
  include ActiveModel::Model

  attr_accessor(
    :id,
    :password,
    :password_confirmation,
  )

  validates :password, presence: true
  validates :password_confirmation, presence: true
  validate :check_credentials

  TOKEN_LIFETIME_IN_HOURS = 24

  def user
    User.find_by(password_reset_token: id)
  end

  private

  def check_credentials
    if user.password_reset_sent_at < TOKEN_LIFETIME_IN_HOURS.hour.ago
      errors.add(:password)
    end
  end
end
