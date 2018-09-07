class BrownPaperTicketsController < ApplicationController
  def test_connection
    event_list_url = 'https://www.brownpapertickets.com/api2/eventlist'
    id = 'HnmMIGDfHp'
    headers = {
        'id' => id
    }
    res = RestClient.get(event_list_url, {id: 'HnmMIGDfHpv'})
    puts res
  end
  def create_event
    create_event_url = 'https://www.brownpapertickets.com/api2/createevent'
    id = 'HnmMIGDfHp'
    account = 'zhengfu23@gmail.com'
    e_name = 'Test BPT'
    e_city = 'New Orleans'
    e_state = 'LA'
    e_short_description = 'This is a test'
    e_description = 'This is just a test, seriously.'

    headers = {
        id: id,
        account: account,
        e_name: e_name,
        e_city: e_city,
        e_state: e_state,
        e_short_description: e_short_description,
        e_description: e_description
    }

    res = RestClient.post(create_event_url, headers)
    puts res
  end
end
