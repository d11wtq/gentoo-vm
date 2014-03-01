vimrc() {
  repo_path="d11wtq/dot-vim.git"

  clone_repo() {
    is_met() {
      [[ -d ~/.vim ]]
    }

    meet() {
      echolog "Cloning $repo_path"
      git clone git://github.com/$repo_path ~/.vim
    }
  }

  git_remote() {
    origin="git@github.com:$repo_path"

    cd ~/.vim

    is_met() {
      git remote -v | grep origin | grep $origin
    }

    meet() {
      git remote rm  origin
      git remote add origin $origin
    }
  }

  setup() {
    is_met() {
      [[ `realpath ~/.vimrc` = `realpath ~/.vim/vimrc` ]]
    }

    meet() {
      echolog "Running $repo_path setup"
      vim -u ~/.vim/setup
    }
  }

  require clone_repo
  require git_remote
  require setup
}
