define ratboxservices::operator (
  $users,
  $flags      = ['admin', 'dcc', 'route'],
  $userserv   = ['admin'],
  $chanserv   = ['admin'],
  $operserv   = ['admin'],
  $nickserv   = ['drop'],
  $operbot    = ['channel'],
  $global     = ['netmsg', 'welcome'],
  $jupeserv   = ['jupe'],
  $banserv    = ['kline', 'xline', 'resv', 'perm', 'remove', 'regexp', 'sync'],
  $password   = 'password',
  $encrypted  = 'no',
  $conffile   = $ratboxservices::conffile
) {
   concat::fragment { "rbx ${name} operator":
    target  => $conffile,
    content => template('ratboxservices/operator.erb'),
    order   => '040',
  }
}