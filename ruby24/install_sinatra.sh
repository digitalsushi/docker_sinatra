#!/bin/bash 

set +e

apt-get update
apt-get  -y install vim apt-utils openssh-server git-core openssh-client build-essential \
openssl libreadline6 libreadline6-dev curl zlib1g zlib1g-dev libssl-dev libyaml-dev \
libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake \
libtool bison pkg-config
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -L https://get.rvm.io | bash -s stable
echo "source /etc/profile.d/rvm.sh" > /etc/profile
source /etc/profile
rvm requirements
rvm install 2.4
gem install bundler --no-ri --no-rdoc
rm -rf /var/lib/apt/lists/*
apt-get remove -y vim openssh-server git-core  \
libreadline6-dev zlib1g-dev libssl-dev libyaml-dev \
libsqlite3-dev libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake \
libtool bison