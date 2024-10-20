{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Tomasz Zurkowski";
    userEmail = "tomasz.zurkowski@gmail.com";
    aliases = {
      st = "status";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
