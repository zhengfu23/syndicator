class EventbriteController < ApplicationController
  require 'eventbrite_sdk'
  EventbriteSDK.token = "3P7L3QRIMRRPMXAWSC42"
  def create_event(params)
    event = EventbriteSDK::Event.build('name.html' => params[:name],
                                       'start.utc' => params[:start_time].iso8601,
                                       'start.timezone' => params[:start_timezone],
                                       'end.utc' => params[:end_time].iso8601,
                                       'end.timezone' => params[:end_timezone],
                                       'currency' => params[:currency])
    event.list!
  end
end
