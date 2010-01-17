require 'stringio'
require 'test/unit'
require 'pathname'
require File.dirname(__FILE__) + '/../lib/whuffiebank'

gem 'thoughtbot-shoulda', '>= 2.10.1'
gem 'jnunemaker-matchy', '0.4.0'
gem 'mocha', '0.9.4'
gem 'fakeweb', '>= 1.2.5'

require 'shoulda'
require 'matchy'
require 'mocha'
require 'fakeweb'

FakeWeb.allow_net_connect = false

class Test::Unit::TestCase
end

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.expand_path(File.dirname(__FILE__) + '/fixtures/' + filename)
  File.read(file_path)
end

def whuffiebank_url(url)
  url =~ /^http/ ? url : "http://thewhuffiebank.org/api#{url}"
end

def stub_get(url, filename, options={})
  opts = {:body => fixture_file(filename)}.merge(options)
  
  FakeWeb.register_uri(:get, whuffiebank_url(url), opts)
end

def stub_post(url, filename)
  FakeWeb.register_uri(:post, whuffiebank_url(url), :body => fixture_file(filename))
end
