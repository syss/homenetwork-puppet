class base::access_point {
	$packages = ['firmware-ralink','bridge-utils']

	ensure_packages ($packages)
	
    class { '::hostapd':
        ssid        => 'Pong Lenis2',
        interface   => 'wlan0',
        bridge      => 'br0',
        wpa_passphrase  => 'ThisIsAVeryLongPassword',
        hw_mode     => 'g',
        channel     => '6',
        wpa         => '2',
        wpa_key_mgmt    => 'WPA-PSK',
        wpa_pairwise    => 'TKIP',
        rsn_pairwise    => 'CCMP',
    }
}
