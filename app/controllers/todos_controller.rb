class TodosController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @todo = Todo.new()
  end


  def create
    @trip = Trip.find(params[:trip_id])
    @todo = @trip.todos.new(todo_params)
    if @todo.save
      flash[:success] = "Activity created."
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title).merge(trip_id: params[:trip_id])
  end
end
