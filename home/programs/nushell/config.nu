$env.EDITOR = "hx"
$env.VISUAL = "hx"

let cap_completer = {|spans|
  command-autocomplete shell nushell -- ...$spans | from json
}

$env.config = {
  show_banner: false,
  buffer_editor: "hx",
  history: {
    file_format: "sqlite",
    isolation: true,   
  },
  completions: {
    external: {
      enable: true,
      max_results: 100,
      completer: $cap_completer,
    },
  },
  hooks: {
    pre_prompt: [{ ||
      if (which direnv | is-empty) {
        return
      }

      direnv export json | from json | default {} | load-env
      if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
        $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
      }
    }]
  }
}
alias zj = zellij

def nixconfig [] {
  cd $"($env.HOME)/.config/home-manager"
  hx
}

