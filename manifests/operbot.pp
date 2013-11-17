class ratboxservices::operbot (
  $nick = 'operbot',
  $username = 'operbot',
  $host = 'services.int',
  $realname = 'oper op/invite services',
  $flags = ['opered', 'msg_self', 'stealth'],
  $param_loglevel = '1',
  $conffile = $ratboxservices::conffile
) {
  concat::fragment { "rbx operbot":
    target  => $conffile,
    content => template('ratboxservices/operbot.erb'),
    order   => '050',
  }
}