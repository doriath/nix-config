{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    # Disable it for now, as we got newer
    # nushell which prints warnings.
    enableNushellIntegration = false;
  };
}
