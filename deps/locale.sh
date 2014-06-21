locale() {
  require locale.gen

  locale.gen() {
    config_file=/etc/locale.gen

    is_met() {
      grep -F en_US.UTF-8 $config_file | grep -Ev '^#'
    }

    meet() {
      sudo sed -i '/^.*en_US.UTF-8.*$/d' $config_file
      sudo sh -c "echo 'en_US.UTF-8 UTF-8' >> $config_file"
    }
  }

  is_met() {
    locale -a | grep -iE 'en_US\.utf-?8'
  }

  meet() {
    sudo locale-gen
  }
}
