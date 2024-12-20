{ pkgs-unstable, config, ... }:
{
  home.file."${config.home.homeDirectory}/.config/zellij/config.kdl" = {
    source = ./config.kdl;
  };
  programs.zellij = {
    enable = true;
    package = pkgs-unstable.zellij;
  };
}
