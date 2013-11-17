class ratboxservices::database (
  $host                     = '127.0.0.1',
  $username                 = 'username',
  $database                 = 'database',
  $password                 = 'password',
  $conffile                 = $ratboxservices::conffile,
) {
  
  concat::fragment { 'rbx database conf':
    target  => $conffile,
    content => template('ratboxservices/database.erb'),
    order   => '002',
  }
}
