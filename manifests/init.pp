class ratboxservices (
  $conffile = $ratboxservices::params::conffile,
  $backend = 'sqlite',
  $mysql_host = 'localhost',
  $mysql_user = 'rbxservices',
  $mysql_password = 'changeme',
  $mysql_database = 'rbxservices'
) inherits ratboxservices::params {
  
  case $backend {
    'mysql': {
      $package = 'ratbox-services-mysql'
    }
    'sqlite': {
      $package = 'ratbox-services-sqlite'
    }
    'pgsql': {
      $package = 'ratbox-services-pgsql'
    }
  }
  
  package { $package:
    ensure => present    
  }
  service { 'ratbox-services':
    ensure  => running,
    enable  => true,
    hasrestart => true,
    hasstatus => false
  }
  exec { 'eanble-ratboxservices-service':
    command => "sed -i 's/ENABLED=0/ENABLED=1/' /etc/init.d/ratbox-services",
    onlyif => 'grep -c ENABLED=0 /etc/init.d/ratbox-services',
    notify => Service['ratbox-services'],
    require => Package[$package],
  }
  
  include concat::setup
  concat { $conffile:
    owner   => "root",
    group   => "irc",
    mode    => "440",
    require => Package[$package],
    notify  => Service['ratbox-services'],
  }
}