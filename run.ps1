# Boilerplate. Load a config file, read some variables. I'm not a powershell expert.
Get-Content "developer_config.txt" | foreach-object -begin {$h=@{}} -process { $k = [regex]::split($_,'='); if(($k[0].CompareTo("") -ne 0) -and ($k[0].StartsWith("[") -ne $True)) { $h.Add($k[0], $k[1]) } }
Set-Variable -Name source_code_dir -Value ([string](Get-Location)+"/app")
Set-Variable -Name web_code_dir -Value $h.Get_Item("host_web_directory")
Write-Host "app directory is ${source_code_dir}"
Write-Host "web directory is ${web_code_dir}"

# What's going on here!? We're loading a new Docker container from an image we also created.
# Mount a static web directory from some place like your desktop, defined in the config file.
# Also mount the app directory from this project, which has the program code.
# The --rm flag means this docker container gets auto-destroyed when we exit the process.
# This way we can run it over, and over, and over, without generating name conflicts.
# Maybe you did a local build of the named image (digitalsushi/sinatra), or maybe it tried
# to pull it in from Docker Hub.
# When you run this, it will connect you as the dude user, and you can go into the indicated
# directories to edit and debug the Sinatra application. Of course, you can edit files
# on the container side, and they will simply be changed up on the host as well, like you expect.

docker run  `
  -v "${web_code_dir}:/webstuff" `
  -v "${source_code_dir}:/app" `
  --rm `
  --name my-sinatra-app `
  -p 4000:4000 --interactive --tty --entrypoint /bin/bash digitalsushi/sinatra:latest