require File.dirname(__FILE__) + '/test_helper.rb'

class TestWhuffiebank < Test::Unit::TestCase

  def setup
  end
  
  def test_truth
    assert true
  end
  
  context "when hitting the whuffie bank API" do
    
    should "return the balance for a whuffie bank member" do
      stub_get("/balance/?username=etagwerker&password=a_password", "balance.json")
      
      balance = Whuffiebank.balance("etagwerker","a_password")

      balance.class.should == Whuffiebank::Balance
    end
  
  end
  
end
