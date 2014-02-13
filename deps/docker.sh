docker() {
  is_met() {
    which docker
  }

  meet() {
    sudo emerge -av app-emulation/docker
  }
}
