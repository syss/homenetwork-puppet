class base {
	$packages = ['vim', 'nload', 'unp', 'hdparm', 'vim-puppet', 'git', 'nmap']

	package {$packages:
		ensure	=> present,
	}
	
	file {'/root/.vimrc':
		ensure	=> file,
		content => file("$module_name/.vimrc"),
	}

    file {'/etc/apt/apt.conf.d/01proxy':
        ensure  => file,
        content => file("$module_name/01proxy"),
    }

    file {'/etc/hdparm.conf':
        ensure  => present,
    }

    service {'hdparm':
        ensure  => running,
        enable  => true,
        subscribe => File['/etc/hdparm.conf'],
    }
}
