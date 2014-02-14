portage_sync() {
  timestamp_chk=/usr/portage/metadata/timestamp.chk

  is_met() {
    if [[ ! -f $timestamp_chk ]]; then
      return 1
    fi

    sync_date=$(date -d "`cat $timestamp_chk`" +%s)
    [[ $sync_date -gt $(expr `date +%s` - 86400) ]]
  }

  meet() {
    sudo emerge --sync
  }

  process
}
