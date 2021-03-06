class ratboxservices::userserv (
  $nick = 'USERSERV',
  $user = 'user',
  $host = 'services.int',
  $realname = 'user registration service',
  $flags = ['opered', 'msg_self'],
  $param_loglevel = '5',
  $disable_register = false,
  $register_url = false,
  $register_time = '1 minute',
  $register_amount = '5',
  $host_register_time = '1 day',
  $host_register_amount = '2',
  $register_email = 'no',
  $register_verify = 'no',
  $expire_time = '4 weeks',
  $expire_suspended_time = '4 weeks',
  $expire_unverified_time = '1 day',
  $expire_bonus_regtime = '2 months',
  $expire_bonus = '1 day',
  $expire_bonus_per_time = '2 weeks',
  $expire_bonus_max = '4 weeks',
  $allow_set_password = 'yes',
  $allow_resetpass = 'no',
  $allow_resetemail = 'no',
  $resetpass_duration = '1 day',
  $resetemail_duration = '1 day',
  $reset_regtime_duration = '2 weeks',
  $allow_set_email = 'yes',
  $max_logins = '5',
  $show_suspend_reasons = 'no',
  $conffile   = $ratboxservices::conffile
) {
  concat::fragment { "rbx userserv":
    target  => $conffile,
    content => template('ratboxservices/userserv.erb'),
    order   => '050',
  }
}