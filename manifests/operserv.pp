class ratboxservices::operserv (
  $nick = 'OPERSERV',
  $username = 'chan',
  $host = 'services.int',
  $realname = 'oper service',
  $flags = ['opered', 'msg_self', 'stealth', 'wallop_adm'],
  $param_loglevel = '1',
  $allow_die = 'yes',
  $conffile = $ratboxservices::conffile
) {
  concat::fragment { "rbx operserv":
    target  => $conffile,
    content => template('ratboxservices/operserv.erb'),
    order   => '050',
  }
}