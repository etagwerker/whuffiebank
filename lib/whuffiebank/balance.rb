module Whuffiebank

  # This is the url_info class for the topsy library. 
  # 
  
  #   result - 'success' or 'failure'
  #
  #   reason - if the result is 'failure', the reason why the request failed.
  #
  #   balance - if the result is 'success', this is the Whuffie Bank user's balance.
  
  
  #   According to the Whuffiebank API doc: http://www.thewhuffiebank.org/static/api
  #
  class Balance < Hashie::Mash
    def to_s
      "Whuffiebank Balance: #{result}, #{balance}"
    end
  end
end
