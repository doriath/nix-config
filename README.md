# doriath's Nix Config

## Installation

```shell
nix-shell -p git

git clone https://github.com/doriath/nix-config.git

cd nix-config

ln -s $PWD ~/.config/home-manager

nix run . -- switch
```
