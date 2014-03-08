eclean_kernel() {
  is_met() {
    which eclean-kernel
  }

  meet() {
    sudo emerge app-admin/eclean-kernel --autounmask-write
    sudo etc-update --automode -5
    sudo emerge app-admin/eclean-kernel
  }
}
