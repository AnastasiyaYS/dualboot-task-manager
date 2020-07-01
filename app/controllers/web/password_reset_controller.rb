class Web::PasswordResetController < Web::ApplicationController
  def new
    @password_reset = PasswordResetRequestForm.new
  end

  def create
    @password_reset = PasswordResetRequestForm.new(password_reset_params)
    if @password_reset.valid?
      @user = User.find_by_email(params[:password_reset_request_form][:email])
      PasswordResetService.send_password_reset(@user) if @user
      flash[:notice] = 'E-mail sent with password reset instructions.'
      redirect_to(new_session_path)
    else
      render(:new)
    end
  end

  def edit
    @user = User.find_by_password_reset_token(params[:id])
    unless @user
      flash[:notice] = 'Token is corrupted'
      redirect_to(new_password_reset_path)
    end
  end

  def update
    @user = User.find_by_password_reset_token(params[:id])
    unless @user
      flash[:notice] = 'Token is corrupted'
      redirect_to(new_password_reset_path)
      return
    end
    @password_reset = PasswordResetForm.new({ id: params[:id] }.merge(user_params(@user)))
    if !@password_reset.valid?
      flash[:notice] = 'Password reset failed. Please try again'
      redirect_to(new_password_reset_path)
    elsif @user.update(user_params(@user))
      flash[:notice] = 'Password has been reset!'
      redirect_to(new_session_path)
      @user.update(password_reset_token: nil, password_reset_sent_at: nil)
    else
      render(:edit)
    end
  end

  private

  def user_params(user)
    role = user.type.downcase
    params.require(role).permit(:password, :password_confirmation)
  end

  def password_reset_params
    params.require(:password_reset_request_form).permit(:email)
  end
end
