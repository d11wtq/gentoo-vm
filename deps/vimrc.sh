vimrc() {
  is_met() {
    [[ -d ~/.vim ]] && [[ -f ~/.vimrc ]]
  }

  meet() {
    # hack to get around strict host checking
    `which git` clone git://github.com/d11wtq/dot-vim.git ~/.vim
    sed -i 's/git:\/\/github\.com\//git@github.com:/g' ~/.vim/.git/config
    vim -u ~/.vim/setup 2>/dev/null
  }
}
