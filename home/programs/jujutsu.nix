{ pkgs-unstable, ... }:
{
  programs.jujutsu = {
    enable = true;
    package = pkgs-unstable.jujutsu;
    settings = {
      user = {
        name = "Tomasz Zurkowski";
        email = "tomasz.zurkowski@gmail.com";
      };
    };
  };
}
