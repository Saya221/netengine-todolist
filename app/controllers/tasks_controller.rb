# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.default
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to root_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to root_path, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy

    redirect_to root_path, notice: 'Task was successfully deleted.'
  end

  def toggle_complete
    @task.completed!

    redirect_to root_path, notice: 'Task was mark as completed.'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit :title, :sub_title, :due_date, :priority, :status
  end
end
