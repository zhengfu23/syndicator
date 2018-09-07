class EventbriteController < ApplicationController
  require 'eventbrite_sdk'
  EventbriteSDK.token = "3P7L3QRIMRRPMXAWSC42"
  def initialize
    @organizer = EventbriteSDK::Organizer.retrieve(id: 17808905770)
  end

  def create_event
    test_venue = EventbriteSDK::Venue.build('name' => 'test venue',
                                            'address.address_1' => '123 test address rd',
                                            'organizer_id' => @organizer.id)
    test_venue.save

    event = EventbriteSDK::Event.build('name.html' => 'test event',
                                       'start.utc' => '2018-09-12T10:00:00Z',
                                       'start.timezone' => 'America/Los_Angeles',
                                       'end.utc' => '2018-09-12T13:00:00Z',
                                       'end.timezone' => 'America/Los_Angeles',
                                       'currency' => 'USD',
                                       'venue_id' => test_venue.id,
                                       'organizer_id' => @organizer.id)
    event.list!
  end
end
