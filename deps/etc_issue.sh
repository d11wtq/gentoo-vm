etc_issue() {
  new_issue=/vagrant/deps/etc_issue/issue

  is_met() {
    diff $new_issue /etc/issue
  }

  meet() {
    sudo cp -f $new_issue /etc/issue
  }
}
