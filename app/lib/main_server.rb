#!/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sinatra/cookies'
require 'pp'
require 'json'
require 'rack'
require "lockfile"
require "listen"
require "#{File.expand_path File.dirname(__FILE__)}/../lib/sinatra_processing.rb"

set :root, Dir['/app']
pp settings.root

configure do
  Rack::Multipart::Parser.const_set('BUFSIZE', 10_000_000) #just leave this, makes it over 30x faster uploads
  enable :logging, :dump_errors, :raise_errors, :sessions
  set :public_folder, '/webstuff'

  file = File.new("#{ENV['HOME']}/sinatra.log", 'a+')
  file.sync = true
  use Rack::CommonLogger, file
end

abort "configure_server.json missing" unless File.exists? "#{File.expand_path File.dirname(__FILE__)}/configure_server.json"
$registry = JSON.parse( File.read("#{File.expand_path File.dirname(__FILE__)}/configure_server.json") )
abort "registry is corrupted, please fix configure_server.json" unless $registry["valid"]

#ActiveRecord::Base.logger = Logger.new(STDOUT)
set :port, $registry["listen_on_tcp_port_development"]
set :bind, $registry["listen_on_ipaddr"]

require "#{File.expand_path File.dirname(__FILE__)}/session_handler.rb"
require "#{File.expand_path File.dirname(__FILE__)}/routes.rb"
use MyCoolApp
