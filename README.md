# UniPac v0.1.1
An unbelieveably wonky Distro-agnostic package management. Currently uses lots of hacks because I'm terrible at shell scripts. Works tho!

## What is tested
Arch Linux
- Installing
- Removing
- Syncing

Testers required for other operating systems!

## What should work
Arch Linux, Ubuntu/Linux Mint, Debian, Gentoo and Fedora/RHEL/CentOS *should* work in theory, but again no tests were run.

## Features
- Automatically add -dev(el) on .deb and .rpm based distros when using option -d before package
- Install and remove packages without need for specifying platform
- Sync (i.e. update) local repo caches

## Coming Soon!(TM)
- Map package names based on distros
- Automated installs


