portage_config() {
  make_conf=/etc/portage/make.conf

  features() {
    pattern='^FEATURES=.*'

    is_met() {
      [[ ! `grep -E "$pattern" $make_conf` ]]
    }

    meet() {
      sudo sed -i "s/$pattern//g" $make_conf
    }

    process
  }

  requires features
}
