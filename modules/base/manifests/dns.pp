class base::dns {

    package {['dnsutils','dnstop']:
        ensure  => present,
    }

    class { '::dns':
        forwarders  => ['8.8.8.8','8.8.4.4'],
        #forwarders  => ['10.0.0.138','8.8.8.8','8.8.4.4'],
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
    ::dns::record {'retropie.sue.ss':
        target  => '10.0.0.21',
        type    =>  'A',
    }
    ::dns::record {'osmc.sue.ss':
        target  => '10.0.0.22',
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
