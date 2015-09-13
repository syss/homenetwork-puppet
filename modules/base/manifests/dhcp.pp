class base::dhcp {
    class {'::dhcp':
        dnsdomain   => ['sue.ss',],
        nameservers => ['ns0.sue.ss'],
        interfaces  => ['eth0'],
    }

    dhcp::pool {'sue.ss':
        network => '10.0.0.0',
        mask    => '255.255.255.0',
        range   => '10.0.0.200 10.0.0.254',
        gateway => '10.0.0.1',
    }

    dhcp::host {
        'a1':       mac => "84:26:15:12:8E:21", ip => "10.0.0.1";
        'cubox':    mac => "00:50:43:1c:12:3a", ip => "10.0.0.11";
        'rpi1':     mac => "b8:27:eb:a2:06:59", ip => "10.0.0.12";
        'retropie': mac => "b8:27:eb:d2:00:8a", ip => "10.0.0.21";
        'printer':  mac => "00:14:38:95:a6:ad", ip => "10.0.0.31";
    }
}
