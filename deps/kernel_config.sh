kernel_config() {
  require kernel_sources

  new_config=/vagrant/deps/kernel_config/config
  old_config=/usr/src/linux/.config
  knl_config=/proc/config.gz

  is_met() {
    (zcat $knl_config || cat $old_config) | diff $new_config -
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
}
