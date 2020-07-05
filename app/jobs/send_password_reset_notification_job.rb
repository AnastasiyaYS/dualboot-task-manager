class SendPasswordResetNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers, lock: :until_and_while_executing, on_conflict: { client: :log, server: :reject }
  sidekiq_throttle_as :mailer

  def perform(user_id)
    user = User.find_by(id: user_id)
    return if user.blank?

    UserMailer.forgot_password(user).deliver_now
  end
end