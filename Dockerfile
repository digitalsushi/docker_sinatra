FROM ubuntu:16.04
MAINTAINER Michael Cross mikec@digitalsushi.com
SHELL ["/bin/bash", "-c", "-l"]
RUN apt-get update

RUN apt-get -y install vim apt-utils
RUN apt-get install -y nginx openssh-server git-core openssh-client
RUN apt-get install -y nano
RUN apt-get install -y build-essential
RUN apt-get install -y openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

RUN \curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN \curl -L https://get.rvm.io | bash -s stable

RUN echo "source /etc/profile.d/rvm.sh" > /etc/profile

RUN source /etc/profile
RUN rvm requirements

RUN rvm install 2.4
RUN gem install bundler --no-ri --no-rdoc

# add users to the rvm group for rvm access
CMD ["/bin/bash"]