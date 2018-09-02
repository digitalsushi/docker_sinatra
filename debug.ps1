Set-Variable -Name source_code_dir -Value ([string](Get-Location)+"/app")

docker run  `
  -v "${HOME}\Desktop\webstuff:/webstuff" `
  -v "${source_code_dir}:/app" `
  --rm `
  --name my-sinatra-app `
  -p 4000:4000 --interactive --tty --entrypoint /bin/bash digitalsushi/sinatra:latest