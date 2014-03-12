projects_dir() {
  target_dir=`realpath ./projects`

  created() {
    is_met() {
      [[ -d $target_dir ]]
    }

    meet() {
      mkdir $target_dir
    }
  }

  symlinked() {
    is_met() {
      [[ `realpath ~/projects` = $target_dir ]]
    }

    meet() {
      ln -snf $target_dir ~/projects
    }
  }

  require created
  require symlinked
}
