class TasksController < ApplicationController

  def index
    @tasks = Current.user.tasks.all
  end

end
