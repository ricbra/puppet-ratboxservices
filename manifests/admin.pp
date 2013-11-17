class ratboxservices::admin (
  $name        = 'admin',
  $description = 'description',
  $email       = 'email@host.tld',
  $conffile    = $ratboxservices::conffile,
) {
  
  concat::fragment { 'rbx admin conf':
    target  => $conffile,
    content => template('ratboxservices/admin.erb'),
    order   => '003',
  }
}
