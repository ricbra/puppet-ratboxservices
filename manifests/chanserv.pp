class ratboxservices::chanserv(
  $nick = 'CHANSERV',
  $username = 'chan',
  $host = 'services.int',
  $realname = 'channel registration service',
  $flags = ['opered', 'login_help'],
  $param_loglevel = '3',
  $disable_register = false,
  $register_time = '1 minute',
  $register_amount = '5',
  $host_register_time = '1 day',
  $host_register_amount = '4',
  $expire_time = '4 weeks',
  $expire_suspended_time = '4 weeks',
  $max_bans = '50',
  $expireban_frequency = '15 minutes',
  $enforcetopic_frequency = '1 hour',
  $autojoin_empty = 'no',
  $email_delowner = 'no',
  $delowner_duration = '1 day',
  $show_suspend_reasons = 'no',
  $conffile = $ratboxservices::conffile
) {
  concat::fragment { "rbx chanserv":
    target  => $conffile,
    content => template('ratboxservices/chanserv.erb'),
    order   => '050',
  }
}