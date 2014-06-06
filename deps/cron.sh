cron() {
  installed() {
    is_met() {
      sudo /usr/sbin/crond --help | grep dillon
    }

    meet() {
      sudo emerge sys-process/dcron
    }
  }

  rc() {
    is_met() {
      sudo rc-status default | grep dcron
    }

    meet() {
      sudo rc-update add dcron default
      sudo rc-update -u
    }
  }

  running() {
    is_met() {
      sudo /etc/init.d/dcron status | grep started
    }

    meet() {
      sudo /etc/init.d/dcron start
    }
  }

  require installed
  require rc
  require running
}
