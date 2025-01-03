{ pkgs, pkgs-unstable, ... }:
{
  programs.helix = {
    enable = true;
    package = pkgs-unstable.helix;
    defaultEditor = true;
    settings = {
      theme = "gruvbox";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
      };
    };
    languages = {
      language-server.nixd = {
        command = "${pkgs.nixd}/bin/nixd";
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
          language-servers = [ "nixd" ];
        }
      ];
    };
  };
}
