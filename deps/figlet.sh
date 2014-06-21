figlet() {
  script=./deps/figlet/figlet

  is_met() {
    which figlet && diff `which figlet` $script
  }

  meet() {
    sudo cp -f $script /usr/local/bin/
  }
}
