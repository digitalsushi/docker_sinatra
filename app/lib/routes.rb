class MyCoolApp < Sinatra::Base

  get '/' do
    redirect "/index.html"
  end
  
  get '/conntest' do
    "connected"
  end
  
  post '/api/1.0/stuff/admin' do
    controller_admin(params)
  end
  
  get '/requires_admin' do
    "You have passed authentication, yay\n"
  end
  
  get '/api/1.0/stuff/malarkey' do
    controller_get_malarkey(params)
  end
  
  get '/api/1.0/stuff/malarkey/:id' do
    controller_get_malarkey_by_id(params)
  end

  get '/template' do
    markdown "_this is a test_"
  end

get '/test' do
  pp settings.root
end

  get '/*' do
    viewname = params[:splat].first   # eg "some/path/here"
  
    if File.exist?("/webstuff/" + viewname)


      if viewname.include?(".js")
      puts "JAVASCRIPT FILE #{viewname}"
      send_file "/webstuff/" + viewname, :type=>'text/javascript'

      else

      end
      send_file "/webstuff/" + viewname

  
    else
      "Nopers, I can't find it."
    end
  end
  
end
