fig() {
  pkg_ver=1.0.0
  pkg_url=https://github.com/docker/fig/releases/download/$pkg_ver/fig-Linux-x86_64

  is_met() {
    which fig && fig --version | grep $pkg_ver
  }

  meet() {
    log "Downloading fig"
    sudo sh -c "curl -sL $pkg_url > /usr/local/bin/fig"
    sudo chmod +x /usr/local/bin/fig
  }
}
