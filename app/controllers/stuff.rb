require "json"
require "sqlite3"
require "active_record"
require "date"
require_relative "../lib/sinatra_processing.rb"
require_relative "../models/stuff.rb"
require_relative "../views/stuff.rb"
#oops oh well
#sigh crap what
def admin?(request)
  if request.cookies['admin']
    if $sessions[request.cookies['admin']]
      return true
    end
  end
  false
end

def controller_get_malarkey(params) 
  view_receiver(params['view'],model_get_malarkey(params))
end

def controller_admin(params)

  session_timeout=600

  if admin?(request) 
    redirect "/index.html?existing_session_is_valid"
  end

  if params['pw']=='please' && params['user']=='admin'
    expiration_date = Time.now + (session_timeout)
    session_long=30.times.map{ Random.rand(11) }.join
    response.set_cookie('admin', :value => session_long, :expires => expiration_date, :path => "/")
    $sessions[session_long]=expiration_date
    if params['redirect_to']
      redirect params['redirect_to']
    else
      redirect "/index.html?new_session_generated"
    end
  else
    redirect "/admin.html?new_session_required"
  end
end
