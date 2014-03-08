gentoolkit() {
  is_met() {
    [[ -x `which equery` ]]
  }

  meet() {
    emerge app-portage/gentoolkit
  }
}
