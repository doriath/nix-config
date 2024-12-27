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
}
alias zj = zellij

def nixconfig [] {
  cd $"($env.HOME)/.config/home-manager"
  hx
}

