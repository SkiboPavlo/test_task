  class TagsController < ApplicationController
  before_action :load_tag, only: [:edit, :update, :destroy, :show]

  def index
    @project = Project.find params[:project_id]
    @task_list = TaskList.find params[:task_list_id]
    @task = Task.find params[:task_id]
    @tags = @task.tags.all
  end

  def new
    task = Task.find params[:task_id]
    @tag = task.tags.new{:task_id}
    @project = Project.find params[:project_id]
    @task_list = TaskList.find params[:task_list_id]
  end

  def edit
  end

  def show
  end

  def create
    @project = Project.find params[:project_id]
    @task_list = TaskList.find params[:task_list_id]
    task = Task.find params[:task_id]
    @tag = task.tags.new{:task_id}
    if @tag.save
      redirect_to project_task_list_task_tags_path
    else
      flash[:errors] = @tag.errors.messages
      render :new
    end
  end

  def update
    if @tag.update_attributes(tag_params)
      redirect_to project_task_list_task_tags_path
    else
      flash[:errors] = @tag.errors.messages
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to project_task_list_task_tags_path
  end

  private

  def load_tag
    @tag = Tag.find params[:id]
    @project = Project.find params[:project_id]
    @task_list = TaskList.find params[:task_list_id]
    @task = Task.find params[:task_id]
    render :file => "#{Rails.root}/public/404.html",  :status => 404 unless @tag
  end

  def tag_params
    params.require(:tag).permit(:title, :description, :project_id, :task_id)
  end
end
