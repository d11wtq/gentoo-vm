#!/bin/bash

# make sure babashka is visible
export PATH=.babashka/bin:$PATH

# hand off to babashka
(cd /vagrant && ! babashka vm)
