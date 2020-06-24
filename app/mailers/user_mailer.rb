class UserMailer < ApplicationMailer
  default from: 'noreply@taskmanager.com'

  def task_created
    @user = params[:user]
    @task = params[:task]
    @author_full_name = get_full_name(@task.author_id)
    @assignee_full_name = @task.assignee_id && get_full_name(@task.assignee_id)

    mail(to: @user.email, subject: 'New Task Created')
  end

  def task_updated
    @user = params[:user]
    @task = params[:task]
    @author_full_name = get_full_name(@task.author_id)
    @assignee_full_name = @task.assignee_id && get_full_name(@task.assignee_id)
    
    mail(to: @user.email, subject: 'Task Updated')
  end

  def task_deleted
    @user = params[:user]
    @task = params[:task]
    @author_full_name = @task[:author_id] && get_full_name(@task[:author_id])
    @assignee_full_name = @task[:assignee_id] && get_full_name(@task[:assignee_id])
    
    mail(to: @user.email, subject: 'Task Deleted')
  end

  def forgot_password(user)
    @user = user
    
    mail(to: @user.email, subject: 'Reset password instructions')
  end

  private

  def get_full_name id
    user = User.find(id)
    user.first_name + ' ' + user.last_name
  end
end
