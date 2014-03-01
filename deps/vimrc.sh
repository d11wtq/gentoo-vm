vimrc() {
  is_met() {
    [[ -d ~/.vim ]] && [[ -f ~/.vimrc ]]
  }

  meet() {
    echolog "Cloning d11wtq/dot-vim.git"
    git clone git://github.com/d11wtq/dot-vim.git ~/.vim
    cd ~/.vim
    git remote rm origin
    git remote add origin git@github.com:d11wtq/dot-vim.git
    echolog "Running d11wtq/dot-vim.git setup"
    vim -u setup
  }
}
