class EventfulController < ApplicationController
  require 'eventful/api'
  @eventful = Eventful::API.new 'n8xtpvsHCmzg3bv2',
                               :user => 'zhengfu23',
                               :password => 'James1993'
  def create_event(params)
    event = @eventful.call 'events/new',
                           :title => params[:name],
                           :start_time => params[:start_time].iso8601,
                           :stop_time => params[:end_time].iso8601,
                           :tz_olson_path => params[:start_timezone],
                           :venue_id => params[:organizer_id]
  end
end
