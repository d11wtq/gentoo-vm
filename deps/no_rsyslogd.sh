no_rsyslogd() {
  is_met() {
    [[ ! -f /usr/sbin/rsyslogd ]]
  }

  meet() {
    sudo emerge -c app-admin/rsyslog
  }
}
