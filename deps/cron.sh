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
    require runlevel dcron default
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
