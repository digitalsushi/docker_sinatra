#!/usr/bin/env ruby

require "test/unit"
require "rack/test"
require "sinatra/base"
require "../lib/routes.rb"
require "../models/stuff.rb"
require "pp"

class App < Sinatra::Base
  use MyCoolApp
end

class HomepageTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    app = App.new
    builder = Rack::Builder.new
    builder.run app
  end

  def test_response_is_ok
    get '/conntest'

    assert last_response.ok?
    assert_equal last_response.body, 'connected'
  end

  def test_model_malarkey
    pp model_get_malarkey(nil)
  end

end
