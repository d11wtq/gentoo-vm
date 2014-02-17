alsa() {
  installed() {
    is_met() {
      [[ -x /usr/bin/alsamixer ]]
    }

    meet() {
      sudo emerge media-sound/alsa-utils
    }

    process
  }

  groups() {
    is_met() {
      [[ `/bin/groups vagrant` =~ audio ]]
    }

    meet() {
      sudo usermod -aG audio vagrant
    }

    process
  }

  requires installed
  requires groups
}
