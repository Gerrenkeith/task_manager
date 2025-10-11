class ListsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @list = @task.lists.create(list_params)
    redirect_to task_path(@task)
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end
