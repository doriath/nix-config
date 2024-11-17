{ inputs, pkgs, ... }:
{
  imports = [ ./home/programs ];
  home = {
    username = "doriath";
    homeDirectory = "/home/doriath";
    stateVersion = "24.05";
  };
}
