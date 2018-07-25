FROM digitalsushi/ruby24
MAINTAINER Michael Cross mikec@digitalsushi.com
SHELL ["/bin/bash", "-c", "-l"]
RUN useradd -ms /bin/bash dude
RUN echo "source /etc/profile.d/rvm.sh" >> /home/dude/.bashrc
RUN usermod -a -G rvm dude
RUN echo "dude ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER dude
WORKDIR /home/dude
COPY --chown=dude Gemfile /home/dude/project/Gemfile
RUN source /etc/profile; cd /home/dude/project/; bundle install
