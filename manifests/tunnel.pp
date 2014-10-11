define stunnel::tunnel(
  $ensure,
  $ca = false,
  $ssl,
  $wildcard = false,
  $accept,
  $connect,
  $sni = undef
) {
  include stunnel::params
  file {"${stunnel::params::conf}/${title}.conf":
    ensure  => $ensure,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    notify  => Class[stunnel::service],
    content => template('stunnel/tunnel.conf.erb')
  }
}
