class TagsController < ApplicationController
  before_action :load_tag, only: [:edit, :update, :destroy, :show]

  def index
    @task = Project.find params[:project_id]
    @tags = @task.tags
  end

  def new
    project = Project.find params[:project_id]
    @tag = project.tags.build
  end

  def edit
  end

  def show
  end

  def create
    project = Project.find(params[:project_id])
    @tag = project.tags.build(tag_params)
    if @tag.save
      redirect_to project_tags_path
    else
      flash[:errors] = @tag.errors.messages
      render :new
    end
  end

  def update
    if @tag.update_attributes(tag_params)
      redirect_to project_tags_path(@tag.project)
    else
      flash[:errors] = @tag.errors.messages
      render :edit
    end
  end

  def destroy
    @tag.destroy
    redirect_to project_tags_path(@tag.project)
  end

  private

  def load_tag
    @tag = Tag.find params[:id]
    render :file => "#{Rails.root}/public/404.html", :status => 404 unless @tag
  end

  def tag_params
    params.require(:tag).permit(:title, :description, :project_id)
  end
end
