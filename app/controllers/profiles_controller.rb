class ProfilesController < ApplicationController
  def show
    @user = User.find_by!(username: params[:username])
    @projects = @user.projects.order(created_at: :desc)
  end
end
