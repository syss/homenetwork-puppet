class base::dns {

    package {['dnsutils','dnstop']:
        ensure  => present,
    }

    class { '::dns':
        #use opendns instead of 10e100
        forwarders  => ['208.67.222.222','208.67.220.220'],
    }

    ::dns::zone { 'sue.ss':
        static_records  => true,
    }
    ::dns::record {'a1.sue.ss':
        target  => '10.0.0.138',
        type    => 'A',
    }
    ::dns::record {'tv.sue.ss':
        target  => '10.0.0.2',
        type    => 'A',
    }
    ::dns::record {'cubox.sue.ss':
        target  => '10.0.0.11',
        type    => 'A',
    }
    ::dns::record {'rpi1.sue.ss':
        target  => '10.0.0.12',
        type    =>  'A',
    }
    ::dns::record {'rpi2.sue.ss':
        target  => '10.0.0.13',
        type    =>  'A',
    }
    ::dns::record {'retropie.sue.ss':
        target  => '10.0.0.21',
        type    =>  'A',
    }
    ::dns::record {'osmc.sue.ss':
        target  => '10.0.0.21',
        type    =>  'A',
    }
    ::dns::record {'printer.sue.ss':
        target  => '10.0.0.31',
        type    =>  'A',
    }
    ::dns::record {'ns0.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'gw.sue.ss':
        target  => 'a1.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'puppet.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'dlna.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'dl.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'pyload.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'torrent.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'rtorrent.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    ::dns::record {'apt-proxy.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }

    #A1 specific DNS entries for properly watching TV
    ::dns::zone { 'ngm.highway.telekom.at':
        static_records  => true,
    }
    ::dns::record {'wngmiap.ngm.highway.telekom.at':
        target  => '213.33.40.248',
        type    =>  'A',
    }
    ::dns::record {'emm.ngm.highway.telekom.at':
        target  => '239.2.0.129',
        type    =>  'A',
    }
    ::dns::record {'vgs.ngm.highway.telekom.at':
        target  => '213.33.34.180',
        type    =>  'A',
    }
}
