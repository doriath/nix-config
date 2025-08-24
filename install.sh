#!/bin/bash
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

echo "experimental-features = flakes nix-command" | sudo tee -a /etc/nix/nix.conf
