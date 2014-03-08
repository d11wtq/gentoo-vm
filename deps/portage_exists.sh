portage_exists() {
  is_met() {
    [[ -d /usr/portage ]]
  }

  meet() {
    sudo emerge-webrsync
  }
}
