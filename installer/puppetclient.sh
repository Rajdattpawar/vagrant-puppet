#!/bin/sh

# install latest version of puppet agent
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
dpkg -i puppetlabs-release-pc1-trusty.deb
apt-get update
apt-get -y install puppet-agent
export PATH=/opt/puppetlabs/bin:$PATH

puppet resource service puppet ensure=running
puppet resource service puppet enable=true