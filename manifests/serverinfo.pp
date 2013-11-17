class ratboxservices::serverinfo (
  $reconnect_time           = '5 minutes',
  $server_name              = 'ircd.services',
  $server_id                = '36D',
  $server_description       = 'Ratbox services',
  $dcc_vhost                = '192.168.4.2',
  $dcc_low_port             = '3000',
  $dcc_high_port            = '5000',
  $ping_time                = '5 minutes',
  $ratbox                   = 'yes',
  $client_flood_max         = '20',
  $client_flood_max_ignore  = '30',
  $client_flood_ignore_time = '5 minutes',
  $client_flood_time        = '1 minute',
  $allow_stats_o            = 'yes',
  $allow_sslonly            = 'no',
  $conffile                 = $ratboxservices::conffile,
) {
  
  concat::fragment { 'rbx serverinfo conf':
    target  => $conffile,
    content => template('ratboxservices/serverinfo.erb'),
    order   => '001',
  }
}
