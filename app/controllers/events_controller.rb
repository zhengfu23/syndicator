class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def new
  end

  def create
    @event = Event.new(name: event_params[:name],
                       start_time: DateTime.parse(event_params[:start_time]),
                       end_time: DateTime.parse(event_params[:end_time]),
                       start_timezone: event_params[:start_timezone],
                       end_timezone: event_params[:end_timezone],
                       currency: event_params[:currency])

    @event.save
    redirect_to @event
  end

  private
  def event_params
    params.require(:event).permit(:name, :start_time, :start_timezone, :end_time, :end_timezone, :currency)
  end
end
