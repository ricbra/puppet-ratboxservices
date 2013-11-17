class ratboxservices::nickserv (
  $nick = 'NICKSERV',
  $username = 'nick',
  $host = 'services.int',
  $realname = 'nick service',
  $flags = ['opered', 'msg_self'],
  $param_loglevel = '3',
  $max_nicks = '2',
  $allow_set_warn = 'yes',
  $warn_string = 'This nickname is registered, you may be disconnected if a user regains this nickname.',
  $conffile = $ratboxservices::conffile
) {
  concat::fragment { "rbx nickserv":
    target  => $conffile,
    content => template('ratboxservices/nickserv.erb'),
    order   => '050',
  }
}