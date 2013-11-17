class ratboxservices::jupeserv (
  $nick = 'JUPESERV',
  $username = 'jupe',
  $host = 'services.int',
  $realname = 'server jupe service',
  $flags = ['opered', 'msg_self', 'stealth'],
  $param_loglevel = '2',
  $merge_into_operserv = 'no',
  $oper_score = '3',
  $jupe_score = '15',
  $unjupe_score = '15',
  $pending_time = '30 minutes',
  $conffile = $ratboxservices::conffile
) {
  concat::fragment { "rbx jupeserv":
    target  => $conffile,
    content => template('ratboxservices/jupeserv.erb'),
    order   => '050',
  }
}