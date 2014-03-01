git() {
  installed() {
    is_met() {
      which git && [[ -f /usr/libexec/git-core/git-remote-https ]]
    }

    meet() {
      sudo USE="curl" emerge dev-vcs/git
    }
  }

  configured() {
    is_met() {
      [[ `git config user.name` = "d11wtq" ]] &&
        [[ `git config user.email` = "chris@w3style.co.uk" ]]
    }

    meet() {
      git config --global user.name  d11wtq
      git config --global user.email chris@w3style.co.uk
    }
  }

  require installed
  require configured
}
