kernel_sources() {
  kernel_ver=3.10.25
  kernel_src=/usr/src/linux-$kernel_ver-aufs

  installed() {
    is_met() {
      [[ -f $kernel_src/Makefile ]]
    }

    meet() {
      echolog "Emerging aufs-sources"
      sudo emerge =sys-kernel/aufs-sources-$kernel_ver
    }
  }

  symlinked() {
    is_met() {
      [[ `realpath /usr/src/linux` = $kernel_src ]]
    }

    meet() {
      sudo ln -snf $kernel_src /usr/src/linux
    }
  }

  require installed
  require symlinked
}
