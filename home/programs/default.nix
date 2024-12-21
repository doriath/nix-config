{
  inputs,
  pkgs,
  pkgs-unstable,
  ...
}:
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
    pkgs.nixd
    pkgs.nixfmt-rfc-style
    inputs.home-manager.packages.${pkgs.system}.default
  ];

  programs.bat.enable = true;
  programs.carapace = {
    enable = true;
    package = pkgs-unstable.carapace;
  };
  programs.fzf.enable = true;
  programs.ripgrep.enable = true;
  programs.starship.enable = true;
  programs.zoxide.enable = true;
}
