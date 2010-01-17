module Whuffiebank

  class Client
    include HTTParty
    format :json
    base_uri "http://thewhuffiebank.org/api"
    
    def balance(username,password)
      response = handle_response(self.class.get("/balance/", :query => {:username => username, :password => password}))
      Whuffiebank::Balance.new(response)  
    end
    
    def give_whuffie(username,password,to_username,amount,options={})
      response = handle_response(self.class.post("/give/", :query => {:username => username, :password => password, :to => to_username, :amount => amount}.merge(options)))
      Whuffiebank::GiveResponse.new(response)
    end
    
    def whuffie(username)
      response = handle_response(self.class.get("/whuffie/", :query => {:username => username} ))
      Whuffiebank::Whuffie.new(response)
    end

    private

      def handle_response(response)
        puts response.code
        puts response.body
        raise_errors(response)
        mashup(response)
      end
      
      def mashup(response)
        Hashie::Mash.new(response)
      end
  
      def raise_errors(response)
        code = response.code.to_i
        case code
        when 400
          raise Whuffiebank::General.new("Parameter check failed. This error indicates that a required parameter is missing or a parameter has a value that is out of bounds.")
        when 403
          raise Whuffiebank::Unauthorized.new
        when 404
          raise Whuffiebank::NotFound.new
        when 500
          raise Whuffiebank::InformWhuffiebank.new
        when 503
          raise Whuffiebank::Unavailable.new
        end
     end
    
  end
end
