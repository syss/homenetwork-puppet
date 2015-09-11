class base::retropie {
    $cmdlinefile = '/boot/cmdline.txt'
    $xboxinit = '/etc/init.d/xboxdrv'
    $xboxetc = '/etc/default/xboxdrv'

    #this only gives info with -d debug option
    rsync::get { '/home/pi/RetroPie/roms':
        source  => 'data@puppet:/data/data/Games/_Roms',
        purge   => false,
    }


    #https://github.com/petrockblog/RetroPie-Setup/wiki/Setting-up-the-XBox360-controller
    #XBOX360 Wireless boost

    file {$cmdlinefile:
        ensure  => file,
        content => file("$module_name/retropie-cmdline.txt"),
    }
    file {$xboxetc:
        owner   => root,
        group   => root,
        mode    => 744,
        content => file("$module_name/xboxdrv-etc"),
    }
    file {$xboxinit:
        owner   => root,
        group   => root,
        mode    => 755,
        content => file("$module_name/xboxdrv"),
    }
    service {'xboxdrv':
        ensure  => running,
        enable => true,
        require => File[$xboxinit,$xboxetc],
        subscribe => File[$xboxetc],
    }
        
    file {'/home/pi/mushberry.png':
        owner   => 'pi',
        group   => 'pi',
        mode    => 744,
        ensure  => file,
        content => file("$module_name/mushberry.png"),
    }
}                                                 
