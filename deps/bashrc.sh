bashrc() {
  new_bashrc=./deps/bashrc/.bashrc
  old_bashrc=~/.bashrc

  is_met() {
    diff $old_bashrc $new_bashrc
  }

  meet() {
    cp -f $new_bashrc $old_bashrc
  }
}
