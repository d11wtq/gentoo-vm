projects_dir() {
  src=~/projects
  dst=/vagrant/projects

  created() {
    is_met() {
      [[ -d $dst ]]
    }

    meet() {
      mkdir $dst
    }
  }

  symlinked() {
    require symlink $src $dst
  }

  require created
  require symlinked
}
