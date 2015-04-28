class base::file_server {

    file {'/etc/hdparm.conf':
        ensure  => file,
        content => file("$module_name/hdparm-file_server.conf"),
    }


    #LABEL=DATA4     /data       ext4    auto,rw,relatime    0   0
    mount { 'DATA4':
        name        => '/data',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'ext4',
        device      => 'LABEL=DATA4',
        options     => 'auto,rw,relatime',
        remounts    => true,
    }
}                                                 
