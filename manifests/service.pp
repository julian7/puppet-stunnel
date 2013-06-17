class stunnel::service($ensure) inherits stunnel::params {
  $running = $ensure ? {
    'absent' => 'absent',
    default  => 'running'
  }

  service {$stunnel::params::service:
    ensure     => $running,
    hasstatus  => false,
    hasrestart => true,
    enable     => true,
    require    => [Class['stunnel::package'], Class['stunnel::files']]
  }
}
