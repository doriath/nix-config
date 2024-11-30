{ inputs, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./helix.nix
    ./nushell.nix
  ];

  home.packages = [
    pkgs.nixd
    pkgs.nixfmt-rfc-style
    inputs.home-manager.packages.${pkgs.system}.default
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
  programs.bat.enable = true;
  programs.carapace.enable = true;
  programs.fzf.enable = true;
  programs.ripgrep.enable = true;
  programs.zellij.enable = true;
  programs.zoxide.enable = true;
}
