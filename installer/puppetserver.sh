#!/bin/sh

# install latest version of puppetserver
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
dpkg -i puppetlabs-release-pc1-trusty.deb
apt-get update
apt-get -y install puppetserver
export PATH=/opt/puppetlabs/bin:$PATH

# add autosign for *.vup.local
echo "*.vup.local" >> /etc/puppetlabs/puppet/autosign.conf

# start and enable puppetserver service
puppet resource service puppetserver ensure=running
puppet resource service puppetserver enable=true

# install puppetdb using puppet module
puppet module install puppetlabs-puppetdb
puppet apply /vagrant/installer/puppetdb.pp
puppet resource service puppetdb ensure=running
puppet resource service puppetdb enable=true

# install puppetboard using puppet module
puppet module install puppet-puppetboard
puppet module install puppetlabs-apache
puppet apply /vagrant/installer/puppetboard.pp