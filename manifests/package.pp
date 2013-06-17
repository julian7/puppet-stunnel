class stunnel::package($ensure) inherits stunnel::params {
  package {$stunnel::params::pkg:
    ensure => $ensure
  }
}
