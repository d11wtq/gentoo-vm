git() {
  libexec_path() {
    re='s/.* in \x27([^ ]+)\x27.*/\1/'
    git help -a | grep "git commands in" | sed -r "$re"
  }

  has_https() {
    ls "$(libexec_path)/git-remote-https" >/dev/null 2>&1
  }

  installed() {
    is_met() {
      which git && has_https
    }

    meet() {
      sudo USE="curl" emerge dev-vcs/git
    }
  }

  config() {
    key=$1
    val=$2

    is_met() {
      [[ `git config "$key"` = "$val" ]]
    }

    meet() {
      git config --global "$key" "$val"
    }
  }

  configured() {
    require config user.name  d11wtq
    require config user.email chris@w3style.co.uk
    require config color.ui   true
    require config alias.st   status
    require config alias.co   checkout
  }

  custom_commands() {
    git_ff() {
      is_met() {
        which git-ff
      }

      meet() {
        sudo cp ./deps/git/git-ff /usr/local/bin
      }
    }

    require git_ff
  }

  require installed
  require configured
  require custom_commands
}
