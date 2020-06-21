class Web::PasswordResetController < Web::ApplicationController
  def new
    @password_reset = PasswordResetForm.new
  end

  def create
    user = User.find_by_email(params[:password_reset_form][:email])
    @password_reset = PasswordResetForm.new
    @password_reset.send_password_reset(user) if user
    flash[:notice] = 'E-mail sent with password reset instructions.'
    redirect_to new_session_path
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])
    render(file: File.join(Rails.root, 'public/404.html'), status: 404, layout: false) unless @user
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    password_reset = PasswordResetForm.new(user_params)
    if @user.password_reset_sent_at < 24.hour.ago
      flash[:notice] = 'Password reset has expired'
      redirect_to new_password_reset_path
    elsif @user.update(user_params)
      flash[:notice] = 'Password has been reset!'
      redirect_to new_session_path
      User.update(@user.id, password_reset_token: nil, password_reset_sent_at: nil)
    else
      render :edit
    end
  end
  
  private

  def user_params
    role = @user.type.downcase
    params.require(role).permit(:password, :password_confirmation)
  end
end
