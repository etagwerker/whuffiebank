require File.dirname(__FILE__) + '/test_helper.rb'

class TestWhuffiebank < Test::Unit::TestCase

  INVALID_TWITTER_USERNAME = 'Invalid twitter username or password'

  context "when hitting the whuffie bank API" do
    
    should "return the balance for a whuffie bank member" do
      stub_get("/balance/?username=etagwerker&password=a_password", "balance.json")
      
      balance = Whuffiebank.balance("etagwerker","a_password")

      balance.class.should == Whuffiebank::Balance
      
      balance.balance.should == 126
      balance.result.should == 'success'
    end
    
    should "return a failure because username/password is wrong" do
      stub_get("/balance/?username=etagwerker&password=bad_password", "balance_error.json")
      
      balance = Whuffiebank.balance("etagwerker","bad_password")

      balance.class.should == Whuffiebank::Balance
      
      balance.balance.should == nil
      balance.result.should == 'failure'
      balance.reason.should == INVALID_TWITTER_USERNAME
    end
    
    should "give whuffie to a username and return success " do
      stub_post('/give/?username=etagwerker&password=a_password&to=rtopsy&amount=12', 'give_whuffie.json')
      
      response = Whuffiebank.give_whuffie('etagwerker','a_password','rtopsy',12)
      
      response.class.should == Whuffiebank::GiveResponse
      
      response.result.should == 'success'
      response.reason.should == nil
    end
    
    should "return failure when trying to give whuffie " do
      stub_post('/give/?username=etagwerker&password=bad_password&to=rtopsy&amount=12', 'give_whuffie_error.json')
      
      response = Whuffiebank.give_whuffie('etagwerker','bad_password','rtopsy',12)
      
      response.class.should == Whuffiebank::GiveResponse
      
      response.result.should == 'failure'
      
      response.reason.should == INVALID_TWITTER_USERNAME
    end
    
    should "return the whuffie information for a particular username " do
      stub_get('/whuffie/?username=etagwerker','whuffie.json')
      
      response = Whuffiebank.whuffie('etagwerker')
      
      response.class.should == Whuffiebank::Whuffie
      
      response.result.should == 'success'
      response.reason.should == nil
      response.whuffie.should == 126
      response.ranking.should == 287842
    end
    
    should "return a failure because the whuffie account doesn't exist " do
      stub_get('/whuffie/?username=account','whuffie_error.json')
      
      response = Whuffiebank.whuffie('account')
      
      response.result.should == 'failure'
      response.reason.should == 'Whuffie Bank account not found'
    end
  
  end

end
