class base::dhcp {
    class {'::dhcp':
        dnsdomain   => ['sue.ss',],
        #nameservers => ['10.0.0.138','ns0.sue.ss'],
        nameservers => ['ns0.sue.ss'],
        interfaces  => ['eth0'],
    }


    #this is for regular devices
    dhcp::pool {'sue.ss':
        network => '10.0.0.0',
        mask    => '255.255.255.0',
        range   => '10.0.0.200 10.0.0.250',
        gateway => '10.0.0.138',
    }

    #this is for devices such as the TV box
    #which needs to have 10.0.0.138 (exact IP!) as nameserver provided via DHCP
    dhcp::pool{ 'other.sue.ss':
        network     => '10.0.0.0',
        mask        => '255.255.255.0',
        range       => '10.0.0.251 10.0.0.254',
        gateway     => '10.0.0.138',
        nameservers => ['10.0.0.138'],
    } 


    dhcp::host {
        'tv':       mac => "68:63:59:ae:e8:bd", ip => "10.0.0.251";
        'cubox':    mac => "00:50:43:1c:12:3a", ip => "10.0.0.11";
        'rpi1':     mac => "b8:27:eb:a2:06:59", ip => "10.0.0.12";
        'retropie': mac => "b8:27:eb:d2:00:8a", ip => "10.0.0.21";
        'printer':  mac => "00:14:38:95:a6:ad", ip => "10.0.0.31";
    }
}
