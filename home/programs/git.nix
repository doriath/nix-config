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
      core = {
        editor = "hx";
        excludesFile = "~/.gitignore";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = "true";
      };
    };
  };
}
