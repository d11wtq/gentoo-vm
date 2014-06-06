# dep to add $service to $runlevel
runlevel() {
  service=$1
  runlevel=$2

  is_met() {
    sudo rc-status $runlevel | grep $service
  }

  meet() {
    sudo rc-update add $service $runlevel
    sudo rc-update -u
  }
}
