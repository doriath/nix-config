# TODO: maybe move to env.nu
$env.PATH = ($env.PATH |
  split row (char esep) |
  append /usr/bin/env
)
$env.EDITOR = "hx"
$env.VISUAL = "hx"

$env.config = {
  show_banner: false,
  buffer_editor: "hx",
}
alias zj = zellij

def nixconfig [] {
  cd $"($env.HOME)/.config/home-manager"
  hx
}
