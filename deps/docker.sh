docker() {
  installed() {
    requires kernel_config

    is_met() {
      which docker 2>/dev/null
    }

    meet() {
      pkg_ver=0.8.0
      pkg_name=app-emulation/docker
      sudo emerge =$pkg_name-$pkg_ver --autounmask-write
      sudo etc-update --automode -3
      sudo emerge =$pkg_name-$pkg_ver
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

  requires installed
  requires rc
}
