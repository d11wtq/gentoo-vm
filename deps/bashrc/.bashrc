# Custom ~/.bashrc for https://github.com/d11wtq/gentoo-vm

# don't run for non-interactive bash
if [[ $- != *i* ]]
then
  return
fi

# prevent insanity
export EDITOR=vim
