define stunnel::tunnel(
  $ensure,
  $ca = undef,
  $ssl,
  $accept,
  $connect
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
