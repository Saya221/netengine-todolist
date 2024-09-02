# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[destroy toggle_complete]

  def index
    @tasks = Task.default
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path, notice: "Task was successfully created."
    else
      flash[:alert] = @task.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  def destroy
    @task.destroy

    redirect_to root_path, notice: "Task was successfully deleted."
  end

  def toggle_complete
    @task.completed? ? @task.in_progress! : @task.completed!

    redirect_to root_path, notice: "Task was marked as #{@task.status.humanize}."
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit :title, :sub_title, :due_date, :priority, :status
  end
end
