define ratboxservices::connect (
  $conffile   = $ratboxservices::conffile,
  $host       = '127.0.0.1',
  $vhost      = false,
  $password   = 'password',
  $port       = '6667',
  $autoconn   = 'yes',
) {
  #$connectclass = $class
  concat::fragment { "rbx ${name} connect":
    target  => $conffile,
    content => template('ratboxservices/connect.erb'),
    order   => '004',
  }
}
