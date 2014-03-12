emerge_sync_cron() {
  new_crontab=./deps/emerge_sync_cron/crontab
  old_crontab=/etc/cron.d/portage

  is_met() {
    diff $old_crontab $new_crontab
  }

  meet() {
    sudo cp -f $new_crontab $old_crontab
  }
}
