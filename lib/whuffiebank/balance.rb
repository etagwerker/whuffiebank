module Whuffiebank

  # This is the Balance class for the whuffiebank library. 
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
      if result.eql? 'success'
        "Whuffiebank Balance: #{result}, #{balance}"  
      else
        "Whuffiebank Balance: #{result}, #{reason}"
      end
    end
  end
end
