kernel_config() {
  requires kernel_sources

  new_config=/vagrant/deps/kernel_config/config
  old_config=/usr/src/linux/.config.custom
  def_config=/usr/src/linux/.config

  is_met() {
    diff $new_config $old_config 2>/dev/null
  }

  meet() {
    cd /usr/src/linux
    sudo make defconfig
    sudo sh -c "cat $new_config >> $old_config"
    sudo sh -c "cat $new_config >> $def_config"
    sudo genkernel \
      --install \
      --symlink \
      --oldconfig \
      --bootloader=grub2 \
      all

    # need to recompile vbox guest stuff
    sudo emerge app-emulation/virtualbox-guest-additions
  }

  process
}
