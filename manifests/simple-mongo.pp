# -*- mode: ruby -*-

class {'::mongodb::globals':
	manage_package_repo => true,
}

class {'::mongodb::server': 
	verbose => true,
	auth => true,
	require       => Class['mongodb::globals'],
}
  
mongodb::db { 'myproject':
	user          => 'myuser',
	password => 'mypassword',
	require       => Class['mongodb::server'],
}

package {'python-pip':
	ensure => present,
}

exec { 'dex':
   command => 'pip install dex',
   path => '/usr/local/bin/:/bin/:/usr/bin/',
   require => Package['python-pip'],
   
}
