class sshd{
    package { 'openssh-server' :
        ensure => '1:6.6p1-2ubuntu2',
    }
    
    service { 'ssh' :
        ensure => running,
        subscribe => File['sshdconfig'],
        require => Package['openssh-server'],
    }

    file{'sshdconfig':
        name => '/etc/ssh/sshd_config',
        owner => root,
        group => root,
        mode => 644,
        source => 'puppet:///modules/sshd/sshd_config',
        require => Package['openssh-server'],
        notify => Service['ssh'],
    }

    file{ '/home/administrator/.ssh/authorized_keys' :
        owner => administrator,
        group => administrator,
        mode => 600,
    }
}
