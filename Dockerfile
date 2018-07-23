FROM ubuntu:16.04
MAINTAINER Michael Cross mikec@digitalsushi.com
SHELL ["/bin/bash", "-c", "-l"]
COPY install_sinatra.sh /tmp/install_sinatra.sh
RUN /tmp/install_sinatra.sh 

# add users to the rvm group for rvm access
CMD ["/bin/bash"]