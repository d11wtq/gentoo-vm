kernel_sources() {
  is_met() {
    [[ -f /usr/src/linux/Makefile ]]
  }

  meet() {
    sudo emerge =sys-kernel/gentoo-sources-`uname -r | sed s/-gentoo//`
  }

  process
}
