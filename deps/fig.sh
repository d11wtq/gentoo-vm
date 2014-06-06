fig() {
  is_met() {
    which fig
  }

  meet() {
    pkg_url=https://github.com/orchardup/fig/releases/download/0.4.1/linux
    sudo sh -c "curl -sL $pkg_url > /usr/local/bin/fig"
    sudo chmod +x /usr/local/bin/fig
  }
}
