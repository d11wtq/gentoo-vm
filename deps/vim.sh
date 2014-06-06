vim() {
  is_met() {
    vim --version | grep -F 7.3
  }

  meet() {
    sudo emerge =app-editors/vim-7.3.762
  }
}
