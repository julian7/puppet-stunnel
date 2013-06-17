class stunnel($ensure = 'present') {
  class {stunnel::package: ensure => $ensure}
  class {stunnel::files:
    ensure => $ensure ? {
      'absent' => absent,
      default  => 'present'
    }
  }
  class {stunnel::service:
    ensure => $ensure ? {
      'absent' => absent,
      default  => 'running'
    }
  }
}
