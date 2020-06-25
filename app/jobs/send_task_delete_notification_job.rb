class SendTaskDeleteNotificationJob < ApplicationJob
  sidekiq_options queue: :mailers, lock: :until_and_while_executing, on_conflict: { client: :log, server: :reject }
  sidekiq_throttle_as :mailer

  def perform(task_id, task_author_id)
    task_author = User.find(task_author_id)
    return if task_author.blank?
    
    UserMailer.with(user: task_author, task_id: task_id).task_deleted.deliver_now
  end
end
