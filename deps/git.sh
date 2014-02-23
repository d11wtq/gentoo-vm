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
    gitbin=`which git`

    is_met() {
      [[ `$gitbin config user.name` = "d11wtq" ]] &&
        [[ `$gitbin config user.email` = "chris@w3style.co.uk" ]]
    }

    meet() {
      $gitbin config --global user.name  d11wtq
      $gitbin config --global user.email chris@w3style.co.uk
    }
  }

  require installed
  require configured
}
