class MyCoolApp < Sinatra::Base

$sessions={} # I want this to be a global because it is very convenient

  before do
  
    $sessions.each do |k,v|
      if (v < Time.now)
        puts "Session #{v} is expired, I am evicting it"
        $sessions.delete(k)
      end
    end
  
    admin_list=%w(/requires_admin)
    allowed=false
  
    if admin_list.include? request.env["PATH_INFO"]
      if cookies[:admin]
        $sessions.each do |k,v|
          if cookies[:admin]==k
            allowed=true
          end
        end
      end
      halt 401, "You need to log in first before I can let you do that\n" unless allowed
    end
  end
  
  after do
    #ActiveRecord::Base.clear_active_connections!
  end

end
