class PicaticController < ApplicationController
  def create_event
    api_key = 'Bearer sk_live_86c61624a690d4c6cbcdb559344ac108'
    url = 'https://api.picatic.com/v2/user/me'
    headers = {authorization: api_key}
    res = RestClient.get(url, {authorization: api_key})
    put res
  end
end
