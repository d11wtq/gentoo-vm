docker() {
  installed() {
    pkg_ver=0.9.0
    pkg_name=app-emulation/docker

    is_met() {
      which docker && docker -v | grep $pkg_ver
    }

    meet() {
      echolog "Emerging docker"
      sudo emerge =$pkg_name-$pkg_ver --autounmask-write
      sudo etc-update --automode -5
      sudo emerge =$pkg_name-$pkg_ver
    }
  }

  rc() {
    is_met() {
      sudo rc-status default | grep docker
    }

    meet() {
      sudo rc-update add docker default
    }
  }

  groups() {
    is_met() {
      [[ `/bin/groups vagrant` =~ docker ]]
    }

    meet() {
      sudo usermod -aG docker vagrant
    }
  }

  require installed
  require rc
  require groups
}
