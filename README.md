# Docker Container of Ruby Sinatra

This is a demo of how to develop a ruby sinatra application from
a windows laptop using Docker containers. 

My use case is that I got a Surface Pro, which is a bit lightweight to
be running full virtual machines. I also never really tried Ruby development
on native windows, and everyone said not to bother.

So this is a pile of really newb quality ccode, i.e. very non-professional code,
that scratches an itch: I can develop files on my laptop in VS Code, and then
load them from the running Sinatra process on the linux ubuntu container, over my
localhost network port forwarding. 

I can also map a volume to static content, so maybe I have some stuff that is
not application code, but I just want a convenient web server to load it into
the browser for UI development, html, css, js, that stuff.