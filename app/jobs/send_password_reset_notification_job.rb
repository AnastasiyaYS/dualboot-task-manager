class SendPasswordResetNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers
  sidekiq_throttle_as :mailer

  def perform(user_id)
    user = User.find_by(id: user_id)
    return if user.blank?

    UserMailer.forgot_password(user).deliver_now
  end
end
