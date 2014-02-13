#!/bin/bash

# make sure babashka is visible ion the path
export PATH=$HOME/.babashka/src/bin:$PATH

# where babashka can be downloaded from
babashka_url=https://raw.github.com/richo/babashka/master/bootstrap.sh

# if babashka can't be found, install it
if [[ ! -x $HOME/.babashka/src/bin/babashka ]]; then
  curl -s $babashka_url | sh /dev/stdin 2>/dev/null
fi

# update portage
sudo emerge --sync

# hand off to babashka
(cd /vagrant && ! babashka vm)
