{ pkgs-unstable, ... }:
{
  programs.jujutsu = {
    enable = true;
    package = pkgs-unstable.jujutsu;
  };
}
