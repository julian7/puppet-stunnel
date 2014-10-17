# stunnel puppet module

This module targets Ubuntu (12.04 onwards) Postfix setups.

## Usage

```ruby
class {stunnel: ensure => 'present'}
class {stunnel::tunnel:
  ensure   => 'present',
  ssl      => 'cert bundle',
  wildcard => true,
  accept   => "ip:port",
  connect  => "ip:port",
  sni      => {
    "SNI.domain" => "connect ip:port"
  }
}
```

### stunnel class options

* ensure: absent / present (default) / latest

### stunnel::tunnel class options

* ensure: absent / present (default)
* ssl: Certificate bundle / key base name (without `.pem` extension) inside
  `/etc/ssl/certs` and `/etc/ssl/private`, respectively
* wildcard: true / false: true if the cert bundle is appropriate to
  every SNI domain (wildcard certificate, or alternative names have been
  added)
* accept: IP and port where TLS connections are accepted
* connect: IP and port where cleartext connections are forwarded to
* sni: host name - connect IP pairs to redefine connect entries for
  different host names.

## Copyright

Copyright &copy; Balazs Nagy, released under the MIT license
