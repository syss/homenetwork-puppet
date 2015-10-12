class hostapd (
  $ssid,
  $interface = undef,
  $bridge = undef,
  $driver = undef,
  $hw_mode = undef,
  $channel = undef,
  $wmm_enabled = undef,
  $ieee80211n = undef,
  $ht_capab = undef,
  $auth_algs = undef,
  $wpa = undef,
  $wpa_passphrase = undef,
  $wpa_key_mgmt = undef,
  $wpa_pairwise = undef,
  $rsn_pairwise = undef,
  $version = 'present',
  $enable = true,
  $start = true,
) {
  class{'hostapd::install':} ->
  class{'hostapd::config':} ~>
  class{'hostapd::service':} ->
  Class['hostapd']
}
