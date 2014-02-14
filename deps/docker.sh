docker() {
  installed() {
    pkg_ver=0.8.0
    pkg_name=app-emulation/docker

    requires kernel_config

    is_met() {
      (which docker && `which docker` version | grep $pkg_ver) 2>/dev/null
    }

    meet() {
      sudo emerge =$pkg_name-$pkg_ver --autounmask-write
      sudo etc-update --automode -5
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

  groups() {
    is_met() {
      [[ `/bin/groups vagrant` =~ docker ]]
    }

    meet() {
      sudo usermod -aG docker vagrant
    }

    process
  }

  requires installed
  requires rc
  requires groups
}
