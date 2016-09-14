class { 'puppetdb': }
class { 'puppetdb::master::config':
	manage_report_processor => true,
	enable_reports          => true,
}