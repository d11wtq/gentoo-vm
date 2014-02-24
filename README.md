# Gentoo Vagrant Box

This is my personal development environment and is not published here for
general public consumption (though you are welcome to do so). Poke around if
you like—I just put it here for re-use and version control.

## In the box

This is a very plain Gentoo virtual machine running Docker under VirtualBox
with Vagrant. Most of my development workflow has shifted to using Docker,
so the Gentoo host itself has very little on it.

Generally I edit code directly on my Mac, but run it in Docker. I do this by
sharing a directory into the VM with Vagrant's synced_folder feature, then in
turn share that folder as a volume into my Docker containers.

## Usage

Assuming you already have VirtualBox and Vagrant installed:

    vagrant up
    vagrant ssh

SSH agent forwarding is enabled.

## Provisioning

On the first boot, the virtual machine is provisioned with
[Skittle](https://github.com/d11wtq/skittle) in order to install Docker and do
some basic configuration. To re-provision the virtual machine at a later date:

    vagrant provision

## Copyright & Licensing

I'm not sure I can license a Linux installation, so go nuts!
