class TasksController < ApplicationController
  before_action :load_task, only: [:edit, :update, :destroy, :show]

  def index
    @tasks = Task.all
    @project = Project.find params[:project_id]
    @task_list = TaskList.find params[:task_list_id]
  end

  def new
    @task = Task.new
    @project = Project.find params[:project_id]
    @task_list = TaskList.find params[:task_list_id]
  end

  def edit
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to project_task_list_tasks_path
    else
      flash[:errors] = @task.errors.messages
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to project_task_list_tasks_path
    else
      flash[:errors] = @task.errors.messages
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_task_list_tasks_path
  end

  private

  def load_task
    @task = Task.find params[:id]
    @project = Project.find params[:project_id]
    @task_list = TaskList.find params[:task_list_id]
    render :file => "#{Rails.root}/public/404.html",  :status => 404 unless @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :user_id, :assignee_id, :task_list_id, :tag_id)
  end
end

