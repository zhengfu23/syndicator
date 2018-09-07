class EventfulController < ApplicationController
  def initialize
    EventfulApi.configure do |config|
      config.app_key='n8xtpvsHCmzg3bv2'
      config.consumer_key='dc743717027e2da0ef77'
      config.consumer_secret='8b9b97410e421e77a75b'
    end
  end

  def create_event(params)
    event = @eventful.call 'events/new',
                           :title => params[:name],
                           :start_time => params[:start_time].iso8601,
                           :stop_time => params[:end_time].iso8601,
                           :tz_olson_path => params[:start_timezone],
                           :venue_id => params[:organizer_id]
  end

  def create_dummy_venue
    client = EventfulApi::Client.new(:oauth_token => 'token', :oauth_secret => 'token secret')
    venue_param_hash = {
        :name => 'test venue',
        :address => '123 test address rd',
        :city => 'test city',
        :region => 'test state',
        :country => 'test country',
        :postal_code => '12345'
    }
    res_hash = client.post('venues/new', venue_param_hash)
    puts res_hash

    puts venue
  end

  def create_dummy_event(params)
    event = @eventful.call 'events/new',
                           :title => 'test event',
                           :start_time => '2018-09-12T10:00:00Z',
                           :stop_time => '2018-09-12T13:00:00Z',
                           :tz_olson_path => params[:start_timezone],
                           :venue_id => params[:organizer_id]
  end
end
