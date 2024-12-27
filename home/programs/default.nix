{ pkgs, pkgs-unstable, ... }:
{
  imports = [
    ./direnv.nix
    ./git
    ./helix.nix
    ./jujutsu.nix
    ./nushell
    ./zellij
  ];

  home.packages = [
    # LSP and formatting for nix
    pkgs.nixd
    pkgs.nixfmt-rfc-style
    # LSP for markdown
    pkgs.marksman
    # LSP for toml
    pkgs.taplo
    # Manage home-manager with home-manager
    pkgs.home-manager
  ];

  programs.bat.enable = true;
  programs.carapace = {
    enable = true;
    package = pkgs-unstable.carapace;
    enableNushellIntegration = false;
  };
  programs.fzf.enable = true;
  programs.ripgrep.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;
}
