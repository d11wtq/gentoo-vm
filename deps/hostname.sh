hostname() {
  name="gentoo"
  file=/etc/conf.d/hostname

  is_met() {
    [[ `hostname` = gentoo ]]
  }

  meet() {
    sudo sed -i "s/hostname=.*/hostname=\"$name\"/" $file
    sudo /etc/init.d/hostname restart
  }
}
