class ratboxservices::email (
  $disable_email             = "yes",
  $email_program             = '"/usr/sbin/sendmail", "-t"',
  $email_name                = "services",
  $email_address             = "services@example.com",
  $email_number              = "15",
  $email_duration            = "1 minute",
  $conffile                  = $ratboxservices::conffile,
) {
  
  concat::fragment { 'rbx email conf':
    target  => $conffile,
    content => template('ratboxservices/email.erb'),
    order   => '003',
  }
}
