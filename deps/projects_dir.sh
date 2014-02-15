projects_dir() {
  target_dir=/vagrant/projects

  created() {
    is_met() {
      [[ -d $target_dir ]]
    }

    meet() {
      mkdir $target_dir
    }

    process
  }

  symlinked() {
    is_met() {
      [[ `realpath ~/projects` = $target_dir ]]
    }

    meet() {
      ln -snf $target_dir ~/projects
    }

    process
  }

  requires created
  requires symlinked
}
