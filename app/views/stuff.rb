require "json"
require_relative "../lib/sinatra_processing.rb"

def json_output(obj)

  content_type :json

  if obj.nil?
    status 404
  elsif obj.include? :http_code
    status obj[:http_code]
  end

  view_object={}
  if obj.nil? 
    view_object[:msg]="The object being returned is null"
    view_object[:response]=nil
  elsif obj.include? :msg
    view_object[:msg]=obj[:msg]
    view_object[:response]=obj[:response]
  else
    view_object[:msg]="no messages"
    view_object[:response]=obj
  end 

  JSON.pretty_generate(view_object.as_json)
end

def txt_output(obj)
  obj.to_json
end


def view_receiver(view_type,obj)
  case view_type
    when "json"
      json_output(obj)
    when "txt"
      txt_output(obj)
    else
      json_output(obj)
  end
end
