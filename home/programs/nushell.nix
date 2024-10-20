{ ...}: {
    programs.nushell = {
    enable = true;
    extraConfig = ''
      let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
        show_banner: false,
        buffer_editor: "hx",
        completions: {
          case_sensitive: false # case-sensitive completions
          quick: true    # set to false to prevent auto-selecting completions
          partial: true    # set to false to prevent partial filling of the prompt
          algorithm: "fuzzy"    # prefix or fuzzy
          external: {
            # set to false to prevent nushell looking into $env.PATH to find more suggestions
            enable: true 
            # set to lower can improve completion performance at the cost of omitting some options
            max_results: 100 
            completer: $carapace_completer # check 'carapace_completer' 
          }
        }
        keybindings: [{
          name: fuzzy_history
          modifier: control
          keycode: char_r
          mode: [emacs, vi_normal, vi_insert]
          event: [
            {
              send: ExecuteHostCommand
              cmd: "commandline (
                history
                  | each { |it| $it.command }
                  | uniq
                  | reverse
                  | str join (char -i 0)
                  | fzf --read0 --layout=reverse --height=40% -q (commandline)
                  | decode utf-8
                  | str trim
              )"
            }
          ]
        }]
      } 
      $env.PATH = ($env.PATH | 
        split row (char esep) |
        prepend /home/myuser/.apps |
        append /usr/bin/env
      )
      alias nixconfig = sudo -E hx /etc/nixos/configuration.nix
    '';
  };
}
