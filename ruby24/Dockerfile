FROM ubuntu:16.04
MAINTAINER Michael Cross mikec@digitalsushi.com
SHELL ["/bin/bash", "-c", "-l"]
COPY install_ruby.sh /tmp/install_ruby.sh
RUN /tmp/install_ruby.sh 

# add users to the rvm group for rvm access
CMD ["/bin/bash"]