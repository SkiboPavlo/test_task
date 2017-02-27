class ProjectsController < ApplicationController
  before_action :load_project, only: [:edit, :update, :destroy, :show]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def show
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      flash[:errors] = @project.errors.messages
      render :new
    end
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to projects_path
    else
      flash[:errors] = @project.errors.messages
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def load_project
    @project = Project.find params[:id]
    render :file => "#{Rails.root}/public/404.html",  :status => 404 unless @project
  end

  def project_params
    params.require(:project).permit(:title, :user_id)
  end

end
