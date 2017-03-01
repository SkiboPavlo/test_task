class TaskListsController < ApplicationController
  before_action :load_task_list, only: [:edit, :update, :destroy, :show]

  def index
    @project = Project.find params[:project_id]
    @task_lists = @project.task_lists.all
  end

  def new
    project = Project.find(params[:project_id])
    @task_list = project.task_lists.build
  end

  def edit
  end

  def show
  end

  def create
    project = Project.find(params[:project_id])
    @task_list = project.task_lists.build(task_list_params)
    if @task_list.save
      redirect_to project_task_lists_path
    else
      flash[:errors] = @task_list.errors.messages
      render :new
    end
  end

  def update
    if @task_list.update_attributes(task_list_params)
      redirect_to project_task_lists_path(@task_list.project.id)
    else
      flash[:errors] = @task_list.errors.messages
      render :edit
    end
  end

  def destroy
    @task_list.destroy
    redirect_to project_task_lists_path(@task_list.project.id)
  end

  private

  def load_task_list
    @task_list = TaskList.find params[:id]
    render :file => "#{Rails.root}/public/404.html",  :status => 404 unless @task_list
  end

  def task_list_params
    params.require(:task_list).permit(:title, :project_id)
  end

end
