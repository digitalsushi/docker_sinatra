#!/usr/bin/env ruby

def yield_test 
  counter=1
  yield "this is the first thing", counter
  puts "now yield_test wants to talk"
  counter=counter*2
  yield "this is the second thing", counter
  puts "now yield_test wants to talk a second time"
end


yield_test do |malarkey, some_counter|
  puts "SAYING: #{malarkey}, #{some_counter}"
end
