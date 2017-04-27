# UniPac beta v0.99
An *slightly less clumsy* Distro-agnostic package management solution.

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
- Automated installs (i.e. pass --noconfirm/--yes to package manager)

## Coming Soon!(TM)
- Map package names based on distros
- Arch Linux AUR support

