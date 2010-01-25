require 'rubygems'

directory = File.expand_path(File.dirname(__FILE__))

gem 'hashie', '~> 0.1.3'
require 'hashie'

gem 'httparty', '~> 0.4.5'
require 'httparty'

module Whuffiebank
  VERSION = '0.0.1'
  
  class WhuffieError < StandardError
    attr_reader :data

    def initialize(data)
      @data = data
      super
    end
  end

  class RateLimitExceeded < StandardError; end
  class Unauthorized      < StandardError; end
  class General           < WhuffieError; end

  class Unavailable   < StandardError; end
  class InformWhuffiebank < StandardError; end
  class NotFound      < StandardError; end

  # Returns the balance for a combination of  username and password
  #
  # @param [String] username
  # @param [String] password
  # @return [Whuffiebank::Balance]
  def self.balance(username,password)
    Whuffiebank::Client.new.balance(username,password)
  end
  
  # Returns the balance for a combination of  username and password
  #
  # @param [String] username
  # @param [String] password
  # @param [String] to_username
  # @param [String] amount
  # @param [Hash] options method options
  #   :reason - Why are you giving whuffie to that user? (String)
  #   :alert - Send a messages using Twitter just after the payment. (1 or 0)  
  # @return [Whuffiebank::GiveResponse]
  def self.give_whuffie(username,password,to_username,amount,options={})
    Whuffiebank::Client.new.give_whuffie(username,password,to_username,amount,options)      
  end
  
  # Returns the whuffie information for a username
  #
  # @param [String] username
  # @return [Whuffiebank::Whuffie]
  def self.whuffie(username)
    Whuffiebank::Client.new.whuffie(username)      
  end  

end

require File.join(directory, 'whuffiebank', 'balance')
require File.join(directory, 'whuffiebank', 'give_response')
require File.join(directory, 'whuffiebank', 'whuffie')

require File.join(directory, 'whuffiebank', 'client')