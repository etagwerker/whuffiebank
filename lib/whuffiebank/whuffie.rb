module Whuffiebank

  # This is the Whuffie class for the whuffiebank library. 
  # 
  #  result - 'success' or 'failure'
  #  reason - if the result is 'failure', the reason why the request failed.
  #  whuffie - if the result is 'success', this is the whuffie rate per month.
  #  ranking - if the result is 'success', this is the global ranking position.  
  #
  #  According to the Whuffiebank API doc: http://www.thewhuffiebank.org/static/api
  #
  class Whuffie < Hashie::Mash
    def to_s
      if result.eql? 'success'
        "Whuffiebank Whuffie: #{result}, Whuffie: #{whuffie}"  
      else
        "Whuffiebank Whuffie: #{result}, #{reason}" 
      end
      
    end
  end
end
