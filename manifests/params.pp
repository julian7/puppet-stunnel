class stunnel::params {
  $pkg = 'stunnel4'
  $service = 'stunnel4'
  $owner = 'stunnel4'
  $group = 'stunnel4'
  $conf = '/etc/stunnel'
  $defaults = "/etc/default/${pkg}"
  $logs = "/var/log/${pkg}"
  $pids = "/var/lib/${pkg}"
  $logrotate = "/etc/logrotate.d/${pkg}"
}
