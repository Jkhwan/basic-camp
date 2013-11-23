class TodosController < ApplicationController

  before_action :require_user, :require_project
  before_action :require_todo, only: [:edit, :update]

  def new
    @todo = @project.todos.new
  end

  def create
    @todo = @project.todos.new(todo_params)
    if @todo.save
      redirect_to project_todos_path, notice: "Todo was created successfully."
    else
      render :new
    end
  end
  
  def show

  end

  def index
    @todos = @project.todos.all
  end

  def edit

  end

  def update
    if @todo.update_attributes(todo_params)
      redirect_to project_todos_path, notice: "Todo was updated successfully."
    else
      render :edit
    end
  end

  protected

  def require_project
    @project = @user.projects.find(params[:project_id])
  end

  def require_user
    @user = current_user
  end

  def require_todo
    @todo = @project.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :due_date, :completed, :importance)
  end
end
