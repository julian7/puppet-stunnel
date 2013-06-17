class stunnel::files($ensure) inherits stunnel::params {
  $reqpackage = $ensure ? {
    'absent' => undef,
    default  => Package[$stunnel::params::pkg]
  }

  File {
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    require => $reqpackage
  }

  $directory = $ensure ? {
    'absent' => 'absent',
    default  => 'directory'
  }

  file {
    $stunnel::params::defaults:
      ensure => $ensure,
      source => 'puppet:///modules/stunnel/defaults'
      ;
    $stunnel::params::conf:
      ensure  => $directory,
      mode    => '0755',
      recurse => true,
      purge   => true
      ;
    [$stunnel::params::logs, $stunnel::params::pids]:
      ensure => $directory,
      mode   => '0755',
      owner  => 'stunnel4',
      group  => 'stunnel4'
      ;
    $stunnel::params::logrotate:
      ensure => $ensure,
      source => 'puppet:///modules/stunnel/logrotate'
      ;
  }
}
