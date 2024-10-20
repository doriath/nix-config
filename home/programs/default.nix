{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./helix.nix
    ./nushell.nix
  ];

  home.packages = [
    pkgs.nixd
    pkgs.nixfmt-rfc-style
  ];

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };
  programs.bat.enable = true;
  programs.fzf.enable = true;
  programs.ripgrep.enable = true;
  programs.zellij.enable = true;
  programs.zoxide.enable = true;
}
