class base {
	$packages = ['vim', 'nload', 'unp', 'hdparm', 'vim-puppet', 'git', 'nmap', 'rsync']

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

    service {'hdparm':
        ensure  => running,
        enable  => true,
        subscribe => File['/etc/hdparm.conf'],
    }
}
