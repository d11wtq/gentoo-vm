alsa() {
  installed() {
    is_met() {
      [[ -x /usr/bin/alsamixer ]]
    }

    meet() {
      echolog "Emerging alsa-utils"
      sudo emerge media-sound/alsa-utils
    }
  }

  groups() {
    is_met() {
      [[ `/bin/groups vagrant` =~ audio ]]
    }

    meet() {
      sudo usermod -aG audio vagrant
    }
  }

  require installed
  require groups
}
