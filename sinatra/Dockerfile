FROM digitalsushi/ruby24
MAINTAINER Michael Cross mikec@digitalsushi.com
SHELL ["/bin/bash", "-c", "-l"]
RUN useradd -ms /bin/bash dude
RUN usermod -a -G rvm dude
USER dude
WORKDIR /home/dude
COPY --chown=dude Gemfile /home/dude/project/Gemfile
RUN source /etc/profile; cd /home/dude/project/; bundle install