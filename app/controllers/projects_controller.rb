class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @project = Project.new
    @projects = current_user.projects.order(created_at: :desc)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to dashboard_path, notice: "Project created!"
    else
      @projects = current_user.projects.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @project = current_user.projects.find(params[:id])
  end

  def update
    @project = current_user.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to dashboard_path(@project), notice: "Project updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = current_user.projects.find(params[:id])
    @project.destroy
    redirect_to dashboard_path, notice: "Project deleted."
  end

  def confirm_delete
    @project = current_user.projects.find(params[:id])
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :video_link, :repository_link)
  end
end
