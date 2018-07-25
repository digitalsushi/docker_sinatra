
Get-Content "developer_config.txt" | foreach-object -begin {$h=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True)) { $h.Add($k[0], $k[1]) } }

docker run  -v "$h.host_web_directory:/webstuff" --rm --name my-sinatra-app `
   -p 80:80 --interactive --tty --entrypoint /bin/bash digitalsushi/sinatra:latest