# Custom ~/.bashrc for https://github.com/d11wtq/gentoo-vm

# don't run for non-interactive bash
if [[ $- != *i* ]]
then
  return
fi

# prevent insanity
export EDITOR=vim

# set the locale sanely
export LC_ALL=en_US.UTF-8

# set the language
export LANG=$LC_ALL
