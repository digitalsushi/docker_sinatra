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
  
end
