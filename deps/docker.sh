docker() {
  installed() {
    is_met() {
      which docker 2>/dev/null
    }

    meet() {
      pkg_name=app-emulation/docker-0.8.0
      sudo emerge =$pkg_name --autounmask-write
      sudo etc-update --automode -3
      sudo emerge =$pkg_name
    }

    process
  }

  rc() {
    is_met() {
      sudo rc-status default | grep docker
    }

    meet() {
      sudo rc-update add docker default
    }

    process
  }

  running() {
    is_met() {
      /etc/init.d/docker status | grep started
    }

    meet() {
      sudo /etc/init.d/docker start
    }

    process
  }

  requires installed
  requires rc
  requires running
}
