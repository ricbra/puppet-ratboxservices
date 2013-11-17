class ratboxservices::params {
	# Location of the conf file based on operating system
	case $osfamily {
		'Debian': {
			$conffile = '/etc/ratbox-services/ratbox-services.conf'
			$package = 'ircd-ratbox'
	   }
	   default: {
	     fail("\$osfamily ${osfamily} is not supported by the ratbox module")
	   }
	}
}
