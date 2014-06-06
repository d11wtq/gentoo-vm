portage() {
  exists() {
    is_met() {
      [[ -d /usr/portage ]]
    }

    meet() {
      sudo emerge-webrsync
    }
  }

  fresh() {
    timestamp_chk=/usr/portage/metadata/timestamp.chk

    is_met() {
      if [[ ! -f $timestamp_chk ]]; then
        return 1
      fi

      sync_date=$(date -d "`cat $timestamp_chk`" +%s)
      [[ $sync_date -gt $(expr `date +%s` - 86400) ]]
    }

    meet() {
      echolog "Syncing portage tree"
      sudo emerge --sync
    }
  }

  require exists
  require fresh
}
