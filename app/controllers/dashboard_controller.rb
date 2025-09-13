class DashboardController < ApplicationController
  before_action :require_login

  def show
    @project = Project.new
    @projects = current_user.projects.order(created_at: :desc)
  end
end
