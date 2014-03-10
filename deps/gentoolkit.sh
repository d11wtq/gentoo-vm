gentoolkit() {
  is_met() {
    [[ -x `which equery` ]]
  }

  meet() {
    sudo emerge app-portage/gentoolkit
  }
}
