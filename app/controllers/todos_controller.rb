class TodosController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @todo = Todo.new
  end


  def create
    @trip = Trip.find(params[:trip_id])
    @todo = @trip.todos.create(todo_params)
    if @todo.save
      flash[:success] = "Activity created."
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @todo = Todo.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    if @todo.save
      flash[:success] = "Your to do item has been updated."
      redirect_to trip_path(@trip)
    else
      flash[:error] = "You activity was not updated. Please try again."
      redirect_to :edit
    end
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash.now[:success] = "Your activity has been removed."
    redirect_to trip_path(@trip)
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :trip_id)
  end
end
