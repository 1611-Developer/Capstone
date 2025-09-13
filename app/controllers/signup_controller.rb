class SignupController < ApplicationController
  allow_unauthenticated_access only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    # Create a new Session record for the user, as expected by your Authentication module
      session_record = Session.create!(
        user: @user,
        ip_address: request.remote_ip,
        user_agent: request.user_agent
      )
      cookies.signed[:session_id] = session_record.id  # <-- This is the key step!
      redirect_to dashboard_path, notice: "Account created!"
    else
      render :new, status: :unprocessable_entity
    end
  end
  rescue ActiveRecord::RecordNotUnique
    @user.errors.add(:base, "Email address or username has already been taken.")
    render :new, status: :unprocessable_entity
  end

  private

  def user_params
    params.require(:user).permit(:email_address, :password, :password_confirmation, :first_name, :last_name, :username, :avatar)
  end

