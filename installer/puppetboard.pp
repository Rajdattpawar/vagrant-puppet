class { 'apache': }
class { 'apache::mod::wsgi': }
class { 'puppetboard': 
	manage_git        => 'latest',
	manage_virtualenv => 'latest',
}
class { 'puppetboard::apache::vhost':
	vhost_name => $::fqdn,
	port       => 80,
}