# -*- mode: ruby -*-

class {'::mongodb::globals':
	manage_package_repo => true,
}

class {'::mongodb::server': 
	verbose => true,
	auth => true,
	bind_ip => ['0.0.0.0'],
	require       => Class['mongodb::globals'],
}
  
mongodb::db { 'myproject':
	user          => 'myuser',
	password => 'mypassword',
	roles => ['dbAdmin'],
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


package {'gem':
    ensure => present,
}

exec {'install-genghisapp':
      command => "gem install genghisapp",
    path    => "/usr/bin/:/bin/",
    require => Package['gem'],
}

package {'build-essential':
    ensure => present,
}

package {'ruby1.9.1-dev':
    ensure => present,
    require => Package['build-essential'],
}

exec {'install-bson_ext':
      command => "gem install bson_ext",
    path    => "/usr/bin/:/bin/",
    require => Package['ruby1.9.1-dev'],
}

exec {'run-genghisapp':
      command => "genghisapp --port 80",
    path    => "/usr/local/bin/:/usr/bin/:/bin/",
    require => [Exec['install-bson_ext'], Exec['install-genghisapp']],
}
