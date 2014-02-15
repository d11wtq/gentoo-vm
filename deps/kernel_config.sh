kernel_config() {
  requires kernel_sources

  new_config=/vagrant/deps/kernel_config/config

  is_met() {
    zcat /proc/config.gz | diff $new_config - 2>/dev/null
  }

  meet() {
    sudo cp -f $new_config /usr/src/linux/.config
    sudo genkernel \
      --install \
      --symlink \
      --oldconfig \
      --bootloader=grub2 \
      all

    rebuild_vbox_guest_additions
  }

  rebuild_vbox_guest_additions() {
    sudo emerge app-emulation/virtualbox-guest-additions
  }

  process
}
