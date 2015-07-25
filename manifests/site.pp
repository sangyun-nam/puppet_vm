node 'namsang-ko.linuxmaster.com' {
#   content => "Hello, puppet master!\n",
}

node /^vm[0-9]+\.linuxmaster\.com$/ {
    include vim_upgrade
    include sshd
}

