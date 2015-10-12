class hostapd::install {
  package{'hostapd':
    ensure => $hostapd::version,
  }
}
