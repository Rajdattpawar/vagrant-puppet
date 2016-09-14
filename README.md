# Fully functional Puppet testing environment using Vagrant on ubuntu 14.04

This provide you fully functional Puppet testing environment using Vagrant on ubuntu 14.04. Environment with pre-install latest [puppetserver](https://docs.puppet.com/puppetserver/latest/services_master_puppetserver.html), puppet-agent, [puppetdb](https://forge.puppet.com/puppetlabs/puppetdb), [puppetboard](https://forge.puppet.com/puppet/puppetboard).

Autosign of agent are enabled for *.vup.local nodes.

### Dependencies:
  - Install latest version [Vagrant](https://www.vagrantup.com/)
  - Install [vagrant-hosts](https://github.com/oscar-stack/vagrant-hosts) vagrant plugin

### How to Start:
  - Checkout https://github.com/patelmanjeet/vagrant-puppet.git in newly created folder
  - Run `vagrant up` to startup your VM
  - Open puppetboard using http://puppet.vup.local by adding host entry `192.168.33.11 puppet.vup.local`
