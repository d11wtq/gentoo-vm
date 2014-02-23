ntpd() {
  installed() {
    is_met() {
      [[ -x /usr/sbin/ntpd ]]
    }

    meet() {
      sudo emerge net-misc/ntp
    }
  }

  configured() {
    new_config=/vagrant/deps/ntpd/ntp.conf
    old_config=/etc/ntp.conf

    is_met() {
      diff $new_config $old_config 2>/dev/null
    }

    meet() {
      sudo cp -f $new_config $old_config
    }
  }

  rc() {
    is_met() {
      sudo rc-status default | grep ntpd
    }

    meet() {
      sudo rc-update add ntpd default
    }
  }

  require installed
  require configured
  require rc
}
