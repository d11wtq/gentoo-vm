fig() {
  pkg_ver=0.5.0
  pkg_url=https://github.com/orchardup/fig/releases/download/$pkg_ver/linux

  is_met() {
    which fig && fig --version | grep $pkg_ver
  }

  meet() {
    echolog "Downloading fig"
    sudo sh -c "curl -sL $pkg_url > /usr/local/bin/fig"
    sudo chmod +x /usr/local/bin/fig
  }
}
