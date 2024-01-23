class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update]

  def index
    # stuff here to display the tasks. NOT in the view I think?
    @tasks = Task.all
  end

  def show

  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      flash[:notice] = 'You have made a task!'
      redirect_to @task
    else
      render :new
    end
  end

  def set_task
    @task = Task.find(params[:id])
    # @task = Task.find_by(id: params[:id]) Not here?
  end

  def task_params
    params.require(:task).permit(:id, :title, :details, :completed)
  end

  def edit
    # form edit?
  end

  def update
    if @task.update(task_params)
      flash[:notice] = 'You edited the task :)'
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = 'DESTROYED'
    redirect_to tasks_path
  end
end
