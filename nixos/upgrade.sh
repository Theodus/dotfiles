#!/bin/sh
set -u -e
cp configuration.nix /etc/nixos/configuration.nix
nixos-rebuild switch --upgrade
