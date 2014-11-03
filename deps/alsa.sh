alsa() {
  installed() {
    is_met() {
      [[ -x /usr/bin/alsamixer ]]
    }

    meet() {
      log "Emerging alsa-utils"
      sudo emerge media-sound/alsa-utils
    }
  }

  groups() {
    require group audio
  }

  require installed
  require groups
}
