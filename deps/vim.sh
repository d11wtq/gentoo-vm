vim() {
  installed() {
    is_met() {
      vim --version | grep -F 7.3
    }

    meet() {
      sudo emerge =app-editors/vim-7.3
    }
  }

  no_bash_support() {
    is_met() {
      ! equery list app-vim/bash-support
    }

    meet() {
      sudo emerge -c app-vim/bash-support
    }
  }

  require installed
  require no_bash_support
}
