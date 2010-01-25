module Whuffiebank

  # This is the url_info class for the topsy library.
  # 
  # result - 'success' or 'failure'
  # reason - if the result is 'failure', the reason why the request failed.
  #
  # According to the Whuffiebank API doc: http://www.thewhuffiebank.org/static/api
  #
  class GiveResponse < Hashie::Mash
    def to_s
      "Whuffiebank Response: #{result}. #{reason}"
    end
  end
end
