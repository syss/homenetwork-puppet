class hostapd::service {

  $ensure = $hostapd::start ? {true => running, default => stopped}

  service{'hostapd':
    ensure => $ensure,
    enable => $hostapd::enable,
  }

}
