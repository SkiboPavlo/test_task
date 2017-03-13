class TasksController < ApplicationController
  before_action :load_task, only: [:edit, :update, :destroy, :show]

  def index
    @task_list = TaskList.find params[:task_list_id]
    @tasks = @task_list.tasks
  end

  def new
    task_list = TaskList.find params[:task_list_id]
    @task = task_list.tasks.build
    @tags = @task.project.tags
  end

  def edit
    @tags = Tag.all
  end

  def show
  end

  def create
    task_list = TaskList.find(params[:task_list_id])
    @task = task_list.tasks.build(task_params)

    if @task.save
      redirect_to task_list_tasks_path
    else
      flash[:errors] = @task.errors.messages
      render :new
    end
  end

  def update
    if @task.update_attributes(task_params)
      redirect_to task_list_tasks_path(@task.task_list)
    else
      flash[:errors] = @task.errors.messages
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to task_list_tasks_path(@task.task_list)
  end

  private

  def load_task
    @task = Task.find params[:id]
    render :file => "#{Rails.root}/public/404.html",  :status => 404 unless @task
  end

  def task_params
    params.require(:task).permit(:title, :description, :user_id, :assignee_id,
      :task_list_id, :attachment, tag_ids: [])
  end
end

