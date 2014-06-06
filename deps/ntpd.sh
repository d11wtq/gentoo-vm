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
    new_config=./deps/ntpd/ntp.conf
    old_config=/etc/ntp.conf

    is_met() {
      diff $new_config $old_config
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
      sudo rc-update -u
    }
  }

  require installed
  require configured
  require rc
}
