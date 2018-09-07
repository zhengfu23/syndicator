class PicaticController < ApplicationController
  def create_event
    api_key = 'Bearer sk_live_86c61624a690d4c6cbcdb559344ac108'
    test_url = 'https://api.picatic.com/v2/user/1002704'
    create_event_url = 'https://api.picatic.com/v2/event'

    require 'uri'
    require 'net/http'

    url = URI("https://api.picatic.com/v2/user/1002704")

    http = Net::HTTP.new(url.host, url.port)

    request = Net::HTTP::Patch.new(url)
    request["authorization"] = 'Bearer sk_live_86c61624a690d4c6cbcdb559344ac108'
    request.body = "{\"data\":{\"attributes\":{\"first_name\":\"Zheng\"},\"id\":\"1002704\",\"type\":\"user\"}}"

    response = http.request(request)
    puts response.read_body
  end
end
