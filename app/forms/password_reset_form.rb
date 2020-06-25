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

  def user
    User.find_by(password_reset_token: id)
  end

  private

  def check_credentials
    if user.password_reset_sent_at < 24.hour.ago
      errors.add(:password)
    end
  end
end
