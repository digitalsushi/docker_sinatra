require "pp"

def sessions_process
  # We have a global set of sessions. we want to print them out to start making this work.
  pp $sessions
end

def is_authorized?(cookies)
 cookies[:admin]=="granted" 
end


def helper_receive_file(params)
  filename = params[:file][:filename]
  file = params[:file][:tempfile]
  tmp_file="/tmp/#{filename}.#{10.times.map{ Random.rand(11) }.join }"
  File.open(tmp_file, 'wb') do |f|
    f.write(file.read)
  end
  tmp_file
end

def helper_csv_from_file(file)
  csv_rawdata=File.read(file)
  CSV.parse(csv_rawdata, :headers=> false)
end

