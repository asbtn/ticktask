class TasksController < ApplicationController

  before_action :set_task, only: %i[update destroy]

  def index
    @tasks = Current.user.tasks.all
  end

  def create
    Current.user.tasks.create(task_params)

    redirect_to tasks_path
  end

  def update
    @task.update!(task_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to tasks_path }
    end
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  private

  def set_task
    @task = Current.user.tasks.find(params[:id])
  end

  def task_params
    params.expect(task: %i[completed description])
  end

end
