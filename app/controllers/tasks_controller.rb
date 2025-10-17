class TasksController < ApplicationController
  def index
    @tasks = Task.all

    respond_to do |format|
      # If the browser requests HTML (e.g., a direct visit)
      format.html { render :index } # Renders the HTML view (if it exists)

      # If the client requests JSON (which your React app does)
      format.json { render json: @tasks }
    end
  end

  def show 
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @task }
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

   def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to @task
    else
      render :edit, status: :unprocessable_entity
    end
end

def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def task_params
      params.require(:task).permit(:title, :body, :due_at, :status)
    end
end

